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
    apiKey: 'AIzaSyA4BNZK9Sgj-k9gi_VItjFocu4BVf93JZc',
    appId: '1:356594832776:web:9f1713831756e2c0ef163d',
    messagingSenderId: '356594832776',
    projectId: 'finger-1',
    authDomain: 'finger-1.firebaseapp.com',
    storageBucket: 'finger-1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBCPTtCGUYfBT77lsbStAdnn2zBjLKJLTs',
    appId: '1:356594832776:android:b2018ff4741dd883ef163d',
    messagingSenderId: '356594832776',
    projectId: 'finger-1',
    storageBucket: 'finger-1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBc0S1YscbRJS3mPSuOPHiFo3xMKkn3T1Q',
    appId: '1:356594832776:ios:9c2109f60e1a76a1ef163d',
    messagingSenderId: '356594832776',
    projectId: 'finger-1',
    storageBucket: 'finger-1.appspot.com',
    iosClientId: '356594832776-33hv8ppfmheshms1ncp658e0p1sk8a2m.apps.googleusercontent.com',
    iosBundleId: 'com.finger.fingerprintTest2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBc0S1YscbRJS3mPSuOPHiFo3xMKkn3T1Q',
    appId: '1:356594832776:ios:9c2109f60e1a76a1ef163d',
    messagingSenderId: '356594832776',
    projectId: 'finger-1',
    storageBucket: 'finger-1.appspot.com',
    iosClientId: '356594832776-33hv8ppfmheshms1ncp658e0p1sk8a2m.apps.googleusercontent.com',
    iosBundleId: 'com.finger.fingerprintTest2',
  );
}
