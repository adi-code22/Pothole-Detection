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
    apiKey: 'AIzaSyDtDdgdFG9MIT6jjKSiysx10A6lwnPyo90',
    appId: '1:875689523840:web:b1e01fa9c99e01bab38465',
    messagingSenderId: '875689523840',
    projectId: 'agromed-f6724',
    authDomain: 'agromed-f6724.firebaseapp.com',
    storageBucket: 'agromed-f6724.appspot.com',
    measurementId: 'G-WPVEC2MW0C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNoWdqPw2ypcseooBJNixKujRR9-UUNTI',
    appId: '1:875689523840:android:4c417577fb3184bfb38465',
    messagingSenderId: '875689523840',
    projectId: 'agromed-f6724',
    storageBucket: 'agromed-f6724.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqIQY_wABZexfu-7Jo4ijUcCSRFgf9cFk',
    appId: '1:875689523840:ios:c0fb3c9e1f4d2a83b38465',
    messagingSenderId: '875689523840',
    projectId: 'agromed-f6724',
    storageBucket: 'agromed-f6724.appspot.com',
    iosClientId: '875689523840-fh3pqcdvfn4omcmv3fcptugikdq7vsqg.apps.googleusercontent.com',
    iosBundleId: 'com.example.buildathonMain',
  );
}