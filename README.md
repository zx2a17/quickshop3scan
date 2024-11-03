# Quickshop 3

My third complete rewrite of the Quickshop app. Using the following stack:
- Global state: Riverpod
- Local state: Hooks
- Navigation: Go Router
- Authentication: Firebase auth
- Data sync: Firestore
- UI Theme: material 3
- HTTP: TBD

## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/to/state-management-sample).

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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
