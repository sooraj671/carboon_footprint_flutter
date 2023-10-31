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
    apiKey: 'AIzaSyAZzV8xvsHHBnzOphP9Bh5nGoTr1N8MvaU',
    appId: '1:329446833555:web:d1050ef702e60543cb3c66',
    messagingSenderId: '329446833555',
    projectId: 'no-carbon-15db2',
    authDomain: 'no-carbon-15db2.firebaseapp.com',
    storageBucket: 'no-carbon-15db2.appspot.com',
    measurementId: 'G-Y1FSEWREF5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCoTWmOJdDRtdZAsMsa_b1mSjVYa5UePqI',
    appId: '1:329446833555:android:b467a49fbec8ecfecb3c66',
    messagingSenderId: '329446833555',
    projectId: 'no-carbon-15db2',
    storageBucket: 'no-carbon-15db2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7dSW2QJ0N2GgQyPBsnOYxYfpBq83oRS4',
    appId: '1:329446833555:ios:490f7ca5555a6a04cb3c66',
    messagingSenderId: '329446833555',
    projectId: 'no-carbon-15db2',
    storageBucket: 'no-carbon-15db2.appspot.com',
    iosClientId: '329446833555-1gcbasnmcakdqomafcsosenn0h166ef3.apps.googleusercontent.com',
    iosBundleId: 'com.rameezcarbon.chaudharyfootprint',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7dSW2QJ0N2GgQyPBsnOYxYfpBq83oRS4',
    appId: '1:329446833555:ios:6e5e5bf4ebae700fcb3c66',
    messagingSenderId: '329446833555',
    projectId: 'no-carbon-15db2',
    storageBucket: 'no-carbon-15db2.appspot.com',
    iosClientId: '329446833555-tk1utldprckdtdt0elblhgni23c71kn9.apps.googleusercontent.com',
    iosBundleId: 'com.rameezcarbon.chaudharyfootprint.RunnerTests',
  );
}
