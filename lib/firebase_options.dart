// firebase_options.dart
// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return const FirebaseOptions(
        apiKey: "AIzaSyBXVnJ2iwL8szAcWCpeTP7xObSGDOuOSWo",
  authDomain: "flutter-application-c92ae.firebaseapp.com",
  databaseURL: "https://flutter-application-c92ae-default-rtdb.firebaseio.com",
  projectId: "flutter-application-c92ae",
  storageBucket: "flutter-application-c92ae.appspot.com",
  messagingSenderId: "949569973682",
  appId: "1:949569973682:web:cfd8a3eb613317ae4088ab",
  measurementId: "G-8BGZSYGH5M"
      );
    } else {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return const FirebaseOptions(
            apiKey: "AIzaSyCkq6OE94Ezqn0vGxco3fcs_C-njeg3f2A",
            authDomain: "flutter-application-c92ae.firebaseapp.com",
            projectId: "flutter-application-c92ae",
            storageBucket: "gs://flutter-application-c92ae.appspot.com",
            messagingSenderId: "949569973682",
            appId: "1:949569973682:android:51d54068fbd775524088ab",
          );
        case TargetPlatform.iOS:
          return const FirebaseOptions(
            apiKey: "YOUR_IOS_API_KEY",
            authDomain: "YOUR_IOS_AUTH_DOMAIN",
            projectId: "YOUR_PROJECT_ID",
            storageBucket: "YOUR_STORAGE_BUCKET",
            messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
            appId: "YOUR_IOS_APP_ID",
          );
        default:
          throw UnsupportedError(
            "Unsupported platform $defaultTargetPlatform");
      }
    }
  }
}