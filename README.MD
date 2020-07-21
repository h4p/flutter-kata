# Installation on macOS

Android Studio is needed for flutter. It is installed via DMG from the website
[https://developer.android.com/studio#downloads](https://developer.android.com/studio#downloads)



The `dart compiler` is installed via

     brew tap dart-lang/dart
     brew install dart


In order to use the `Android Debugger (adb)` and other tools install

     brew cask install android-platform-tools


`Flutter` itself is installed by cloning the repository

     git clone https://github.com/flutter/flutter.git -b stable --depth 1

Add flutter to the PATH environment variable

     FLUTTER_HOME="$HOME/github/flutter/bin"
     export PATH="$PATH:$FLUTTER_HOME"


Run `flutter doctor` to see missing dependencies


For offline deployment you need to create an APK bundle with the `bundletools` that can be installed with

     brew install bundletool


# First App
To create a web run

     flutter create my_app
     cd my_app
     flutter run


Devices can be listed with

     flutter devices


For Android make sure that the
  * `developer mode` has been **enabled**,
  * `USB-Debugging` is **active** and
  * Android Studio has been installed and the Wizward was executed


# Configure Editor
It is recommended to use the Android SDK. After starting the `Flutter` Plugin must be installed


# Online Editor
For tutorials the `DartPad` Editor can be used. The link is:

 * [https://dartpad.dartlang.org/](https://dartpad.dartlang.org/)



# Deployment
The offline deployment has three steps:
  * If you haven’t done so already, download bundletool from the GitHub repository.
  * Generate a set of APKs from your app bundle.
  * Deploy the APKs to connected devices.

## Create App Bundle
For distribution to Google App Store

    flutter build apppbundle


## Generating APKs
In Android Studio click Build -> Flutter -> Build APK. After that you run the bundletool with

     bundletool build-apks --bundle=build/app/outputs/bundle/release/app-release.aab --output=habits_app.apks


## Deploy the APKs to connected devices
Once again the bundletool is used to do that

     bundletool install-apks --apks=habits_app.apks


## Allow Internet Access
The following lines must be present in the `AndroidManifest.xml` file located in android/app/src/main/

    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

