// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAhRSY5HPoLraCo392zo-QT5UxYNSB_edE',
    appId: '1:1075481335773:web:5785a814f8db83e8d14834',
    messagingSenderId: '1075481335773',
    projectId: 'imbedded-system',
    authDomain: 'imbedded-system.firebaseapp.com',
    databaseURL: 'https://imbedded-system-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'imbedded-system.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBBE-YrsBcspvOSgb075PCXFvzD7MVONk',
    appId: '1:1075481335773:android:3ade17e4bf7b3040d14834',
    messagingSenderId: '1075481335773',
    projectId: 'imbedded-system',
    databaseURL: 'https://imbedded-system-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'imbedded-system.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9iH1KthwJzOiBiQBfeChVFYVBMOX1eEQ',
    appId: '1:1075481335773:ios:41076ef3450c2690d14834',
    messagingSenderId: '1075481335773',
    projectId: 'imbedded-system',
    databaseURL: 'https://imbedded-system-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'imbedded-system.appspot.com',
    iosClientId: '1075481335773-v9m2g2bfvcbm9cd5rvc0r1a7lnn5dhtl.apps.googleusercontent.com',
    iosBundleId: 'com.example.embbed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB9iH1KthwJzOiBiQBfeChVFYVBMOX1eEQ',
    appId: '1:1075481335773:ios:41076ef3450c2690d14834',
    messagingSenderId: '1075481335773',
    projectId: 'imbedded-system',
    databaseURL: 'https://imbedded-system-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'imbedded-system.appspot.com',
    iosClientId: '1075481335773-v9m2g2bfvcbm9cd5rvc0r1a7lnn5dhtl.apps.googleusercontent.com',
    iosBundleId: 'com.example.embbed',
  );
}