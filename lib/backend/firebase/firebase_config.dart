import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDbtniM5OcMRS9Hr8H5Chxq8qxugkuKm24",
            authDomain: "top300-bkkvg5.firebaseapp.com",
            projectId: "top300-bkkvg5",
            storageBucket: "top300-bkkvg5.firebasestorage.app",
            messagingSenderId: "967328115163",
            appId: "1:967328115163:web:a4802e358f940cafdc1ffe"));
  } else {
    await Firebase.initializeApp();
  }
}
