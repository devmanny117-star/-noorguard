import Flutter
import UIKit
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
  }

  // Prayer reminder notification identifiers (match the Dart-side ids 0–4).
  // When the app is in the foreground the in-app audio player handles the
  // adhan for these, so the banner must be presented without sound to avoid
  // two adhans overlapping. Any other notification (e.g. the test, id 999)
  // keeps its sound.
  private static let prayerNotificationIds: Set<String> = ["0", "1", "2", "3", "4"]

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
      completionHandler(isPrayer ? [.banner, .badge, .list]
                                 : [.banner, .badge, .sound, .list])
    } else {
      completionHandler(isPrayer ? [.alert, .badge] : [.alert, .badge, .sound])
    }
  }
}
