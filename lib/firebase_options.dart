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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDi8W-bAw4qI0VdTQys_f02tKItTmrSLrY',
    appId: '1:305563350345:web:32e5892e30aea58e7f1698',
    messagingSenderId: '305563350345',
    projectId: 'food-order-6',
    authDomain: 'food-order-6.firebaseapp.com',
    storageBucket: 'food-order-6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7LSSW0eqYqdIG9tTgc_6RFbnIoMXXVe8',
    appId: '1:305563350345:android:8d91e9ea1f6200bc7f1698',
    messagingSenderId: '305563350345',
    projectId: 'food-order-6',
    storageBucket: 'food-order-6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiWemA0lGvK54ts3PIduX-Mdq9QsbK1A4',
    appId: '1:305563350345:ios:bf5cea473b2331487f1698',
    messagingSenderId: '305563350345',
    projectId: 'food-order-6',
    storageBucket: 'food-order-6.appspot.com',
    iosClientId: '305563350345-6sb5j5q7thatrnq0v1mi7ggudnfughk4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fooddelivery',
  );
}
