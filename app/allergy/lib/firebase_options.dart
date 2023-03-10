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
    apiKey: 'AIzaSyAisdjZf5d2udUVuPr1y3J2eS0PCgPAj-o',
    appId: '1:228939723832:web:391c5bc3a31b531217a2cd',
    messagingSenderId: '228939723832',
    projectId: 'allergyflutter',
    authDomain: 'allergyflutter.firebaseapp.com',
    storageBucket: 'allergyflutter.appspot.com',
    measurementId: 'G-7Y4RSJ5YTY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIHCPY7T81qgHfk9zWgvSwH39FZ_3yjNw',
    appId: '1:228939723832:android:9462d26ce93c8ec117a2cd',
    messagingSenderId: '228939723832',
    projectId: 'allergyflutter',
    storageBucket: 'allergyflutter.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBwW8URPMGZdKTub38BOQsIAZk8X-HuezQ',
    appId: '1:228939723832:ios:1d18c7eb30e923a617a2cd',
    messagingSenderId: '228939723832',
    projectId: 'allergyflutter',
    storageBucket: 'allergyflutter.appspot.com',
    iosClientId:
        '228939723832-36e22quonrseiqmrcumo7nn8fc5g5pmf.apps.googleusercontent.com',
    iosBundleId: 'com.example.allergy',
  );
}
