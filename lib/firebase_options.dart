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
    apiKey: 'AIzaSyADMRdqLOirubxUwrm0IDCFXAWokHt8X8M',
    appId: '1:578791414879:web:fab36d32f95c2251844fea',
    messagingSenderId: '578791414879',
    projectId: 'pimp-my-dev',
    authDomain: 'pimp-my-dev.firebaseapp.com',
    storageBucket: 'pimp-my-dev.appspot.com',
    measurementId: 'G-2TRLTE4MT1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrVULOCrsXfCHGMrsbgzD9Y-DnXlf0MII',
    appId: '1:578791414879:android:c4e76b2e3cc1c67e844fea',
    messagingSenderId: '578791414879',
    projectId: 'pimp-my-dev',
    storageBucket: 'pimp-my-dev.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBI45yMLzPgh5CpQ2xtHNHUuBOh22wdEzU',
    appId: '1:578791414879:ios:30ce3c8209a20df2844fea',
    messagingSenderId: '578791414879',
    projectId: 'pimp-my-dev',
    storageBucket: 'pimp-my-dev.appspot.com',
    iosClientId: '578791414879-ceqg73mpvrtie8bnh7660friunlda01e.apps.googleusercontent.com',
    iosBundleId: 'com.example.pimpMyDev',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBI45yMLzPgh5CpQ2xtHNHUuBOh22wdEzU',
    appId: '1:578791414879:ios:eee34aa4ba9a3db9844fea',
    messagingSenderId: '578791414879',
    projectId: 'pimp-my-dev',
    storageBucket: 'pimp-my-dev.appspot.com',
    iosClientId: '578791414879-6m5nhrp891ge9hbqde84hmc27i7gtfsl.apps.googleusercontent.com',
    iosBundleId: 'net.scub.pimpmydev',
  );
}
