import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {

  /// MethodChannel shared with Dart's AdhanForegroundController.
  /// Used to signal stopAdhan when the user taps or swipes away the prayer banner.
  var adhanChannel: FlutterMethodChannel?

  // Prayer reminder notification identifiers (match the Dart-side ids 0–4).
  // When the app is in the foreground the in-app audio player handles the
  // adhan for these, so the banner must be presented without sound to avoid
  // two adhans overlapping. Any other notification (e.g. the test, id 999)
  // keeps its sound.
  private static let prayerNotificationIds: Set<String> = ["0", "1", "2", "3", "4"]

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)

    // Own the notification delegate directly. Under FlutterImplicitEngineDelegate
    // the plugin's delegate-forwarding chain is broken, so unless we claim it
    // here our willPresent override below never fires and iOS suppresses the
    // foreground prayer banner entirely.
    UNUserNotificationCenter.current().delegate = self

    // Register the PRAYER_ADHAN category with customDismissAction so that
    // swiping away the banner fires didReceive (→ stop adhan).
    let prayerCategory = UNNotificationCategory(
      identifier: "PRAYER_ADHAN",
      actions: [],
      intentIdentifiers: [],
      options: [.customDismissAction]
    )
    UNUserNotificationCenter.current().setNotificationCategories([prayerCategory])

    return result
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // Re-assert ownership after plugin registration, which may otherwise reset
    // the delegate to the plugin instance.
    UNUserNotificationCenter.current().delegate = self

    // Set up the adhan control channel.
    // Dart calls setPlaying to keep native in sync; native calls stopAdhan
    // when the prayer banner is tapped or swiped away.
    if let controller = window?.rootViewController as? FlutterViewController {
      adhanChannel = FlutterMethodChannel(
        name: "adhan_control",
        binaryMessenger: controller.binaryMessenger
      )
      adhanChannel?.setMethodCallHandler { [weak self] call, result in
        guard let self else { return }
        switch call.method {
        case "setPlaying":
          // Acknowledged — not used on iOS (volume key interception removed).
          result(nil)
        case "showSilentBanner":
          // Handled on Android only; iOS uses flutter_local_notifications.
          result(nil)
        default:
          result(FlutterMethodNotImplemented)
        }
      }
    }
  }

  // flutter_local_notifications relies on a delegate-forwarding chain from
  // FlutterAppDelegate that doesn't work with FlutterImplicitEngineDelegate,
  // so willPresent is never called on the plugin and foreground notifications
  // are silently suppressed. Handle it here directly instead.
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    let isPrayer = AppDelegate.prayerNotificationIds.contains(
      notification.request.identifier)
    if #available(iOS 14.0, *) {
      completionHandler(
        isPrayer ? [.banner, .badge, .list] : [.banner, .badge, .sound, .list])
    } else {
      completionHandler(isPrayer ? [.alert, .badge] : [.alert, .badge, .sound])
    }
  }

  /// Handles the user tapping (UNNotificationDefaultActionIdentifier) or
  /// swiping away (UNNotificationDismissActionIdentifier) a prayer banner.
  /// Both stop the in-app adhan via the adhan_control channel.
  /// super is also called so flutter_local_notifications fires the Dart
  /// onDidReceiveNotificationResponse callback as a second safety net.
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    let isPrayer = AppDelegate.prayerNotificationIds.contains(
      response.notification.request.identifier)

    if isPrayer {
      let action = response.actionIdentifier
      if action == UNNotificationDefaultActionIdentifier
        || action == UNNotificationDismissActionIdentifier
      {
        adhanChannel?.invokeMethod("stopAdhan", arguments: nil)
      }
    }

    // Forward to super so flutter_local_notifications fires the Dart
    // onDidReceiveNotificationResponse callback (second safety net for tap).
    super.userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
  }
}
