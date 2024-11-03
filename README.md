# Quickshop 3

My third complete rewrite of the Quickshop app. Using the following stack:
- Global state: Riverpod
- Local state: Hooks
- Navigation: Go Router
- Authentication: Firebase auth
- Data sync: Firestore
- UI Theme: material 3
- HTTP: TBD



## Setup

### Android Studio
Android Studio 2024.2.1 started using Open JDK version 21 as its bundled java development kit. With Flutter 3.24.3 this produced [compile errors similar to this issue](https://github.com/flutter/flutter/issues/156304) upon adding the google sign in plugin.  

[Changes suggested in this comment](https://github.com/flutter/flutter/issues/156304#issuecomment-2397707812) resovled the issue by bumping gradle and java versions, so upgrading to at least Android Studio 2024.2.1 is advisable to prevent compilation issues. 

### App Secrets
Sensitive values are defined in a JSON file and passed to flutter build/run using a Dart define argument with `--dart-define-from-file`. 

The JSON file is stored as a flattened string in Github Secrets. To run the app locally, the following secrets should be copied from Github Secrets, into corresponding files named `settings/<SECRET_NAME>.json`:
- `app_secrets_dev`
- `app_secrets_prod`

The JSON secret files are stored as a single line string in Github Secrets due to issues with Github Actions unnecessarily censoring special characters if a secret contains formatted JSON: [See here for details](https://github.com/google-github-actions/auth/blob/main/docs/TROUBLESHOOTING.md#aggressive--replacement-in-logs). This issue does not impact running locally, so it is safe to format the JSON file locally with newlines and indentation if you prefer. 

To run Quickshop against another Firebase project, copy and rename the `settings/app_secrets_example.json` file to `app_secrets_<ENV>.json` file

Appropriate values can be generated by using the `flutterfire` CLI tool, and then copying the values from the generated `<ENV>.dart` file into the corresponding secrets file.

```
flutterfire configure --project=quickshop-ENV --out=lib/firebase/ENV.dart --android-package-name=com.buntagon.quickshop.ENV --android-out=android/app/src/ENV/google-services.json --platforms=android,web,windows
```

The `firebaseGoogleAuthWebClientId` can be found in the Firebase console as the "Web client ID" described here: https://github.com/firebase/FirebaseUI-Flutter/blob/main/docs/firebase-ui-auth/providers/oauth.md

**What is a sensitive value?**
Google documentation states that Firebase API keys are safe to included in code or checked in to source control: https://firebase.google.com/docs/projects/api-keys#general-info. Furthermore, in general a public application cannot be considered capable of keeping any values secret. A determined attacker will always be able to find a way to extract them, e.g. by decompiling the application, or by inspecting outbound network packets. 

As such, it might seem pointless to designate any values as secret/sensitive in a public application. However, because this repo itself is public, these API keys and Firebase configuration values have been hidden to encourage anyone cloning the repo to run it against their own Firebase project. 

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/to/resolution-aware-images).

### App Icon
Android Studio was used to import the SVG file of the app icon. The imported icon file did not have any padding around the icon. The import process in Android Studio generates WEBP files at each display density, although it can be configured to create PNG files instead. It also converts the SVG into an Android Vector Drawable format, adding sufficient padding so it can be used as an [adaptive icon](https://developer.android.com/develop/ui/views/launch/icon_design_adaptive). Because the Quickshop icon silhouete is sufficiently distinct when converted to a single colour, `android\app\src\main\res\mipmap-anydpi-v26\ic_launcher.xml` was modified to set the monochrome icon to be the same as the adaptive icon foreground. 

To add the app icons for the DEV flavor
1. Define the flavor dimension and flavor in `android\app\build.gradle`
2. Sync the project with gradle in Android Studio
3. Create the `android\app\src\dev\res` folder
4. Import the dev icon by right clicking on the new `res` folder, selecting `New > Image Asset`, then on the second screen use the drop down to select `dev` as the source set for importing the icon



## Localization
This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter apps](https://flutter.dev/to/internationalization).
