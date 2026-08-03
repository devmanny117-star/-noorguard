# `dev` flavor source set

Gradle merges everything in here on top of `src/main/` when building the `dev`
flavor, and ignores it entirely for `prod`.

## `google-services.json`

The `com.google.gms.google-services` Gradle plugin fails the build unless it
finds a client whose `package_name` matches the applicationId being built. The
`dev` flavor uses `com.noorguard.app.dev`, which the root
`android/app/google-services.json` does not contain — hence this copy.

**This file reuses the production Firebase Android app** (same
`mobilesdk_app_id`, same API key), with only `package_name` changed. It is not a
separate Firebase app.

Two consequences worth knowing:

- Dart-side Firebase is unaffected. `lib/main.dart` calls
  `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)`, so
  Firestore reads and writes use the options compiled into
  `lib/firebase_options.dart` regardless of what this file says.
- **Dev builds therefore share production Firestore data.** There is no data
  isolation between flavors today.

To get real separation, register `com.noorguard.app.dev` as an additional
Android app in the Firebase console, download its `google-services.json` over
this file, and generate a matching Dart options file so dev writes to its own
project. Note that `flutterfire configure` rewrites the *root*
`android/app/google-services.json`; it does not touch this one, so this file
must be updated by hand.
