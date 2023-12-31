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
    apiKey: 'AIzaSyCCXh7hPInCfLMXQekSjC2c3HPIqtCnI78',
    appId: '1:1024325791627:web:b3929e0ff8d410d1a1098e',
    messagingSenderId: '1024325791627',
    projectId: 'one-clik-clean',
    authDomain: 'one-clik-clean.firebaseapp.com',
    storageBucket: 'one-clik-clean.appspot.com',
    measurementId: 'G-LRM2X6Q4LH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTn9LNxqm6YrknqcojtSkwL3KZejNevkc',
    appId: '1:1024325791627:android:f39a537632307d1da1098e',
    messagingSenderId: '1024325791627',
    projectId: 'one-clik-clean',
    storageBucket: 'one-clik-clean.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLs3lGWDf1GOWex-0OnWT1nHcKmMlnCMU',
    appId: '1:1024325791627:ios:2702936157351e03a1098e',
    messagingSenderId: '1024325791627',
    projectId: 'one-clik-clean',
    storageBucket: 'one-clik-clean.appspot.com',
    iosBundleId: 'com.one.click.oneClickClearer',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBLs3lGWDf1GOWex-0OnWT1nHcKmMlnCMU',
    appId: '1:1024325791627:ios:0710a1aa377de3e5a1098e',
    messagingSenderId: '1024325791627',
    projectId: 'one-clik-clean',
    storageBucket: 'one-clik-clean.appspot.com',
    iosBundleId: 'com.one.click.oneClickClearer.RunnerTests',
  );
}
