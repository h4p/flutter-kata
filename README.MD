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
