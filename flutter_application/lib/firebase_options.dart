// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCu6XHIFTFgI8l0oxaXXK67NwJjddab2h8',
    appId: '1:707005714330:web:1b136ecb06464eb3eb7423',
    messagingSenderId: '707005714330',
    projectId: 'fooduni-78a5f',
    authDomain: 'fooduni-78a5f.firebaseapp.com',
    storageBucket: 'fooduni-78a5f.appspot.com',
    measurementId: 'G-3YZT9MQS6S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD4Pt0ss4C3Ynri8kGIPle9gNvqFEpuT7A',
    appId: '1:707005714330:android:9e7e9f62e32f75eceb7423',
    messagingSenderId: '707005714330',
    projectId: 'fooduni-78a5f',
    storageBucket: 'fooduni-78a5f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBG3IYyuUEvBWC3fAqaz-H-F3yZkQC2InM',
    appId: '1:707005714330:ios:eaba6ff708c66422eb7423',
    messagingSenderId: '707005714330',
    projectId: 'fooduni-78a5f',
    storageBucket: 'fooduni-78a5f.appspot.com',
    iosClientId: '707005714330-icq5lb09hhekllmgj9bsnb2jb4t9ger6.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBG3IYyuUEvBWC3fAqaz-H-F3yZkQC2InM',
    appId: '1:707005714330:ios:eaba6ff708c66422eb7423',
    messagingSenderId: '707005714330',
    projectId: 'fooduni-78a5f',
    storageBucket: 'fooduni-78a5f.appspot.com',
    iosClientId: '707005714330-icq5lb09hhekllmgj9bsnb2jb4t9ger6.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication',
  );
}