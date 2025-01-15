import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDGcwEALEDVqLByLsfwQbGXzDWuh-xsmBE",
            authDomain: "top300-rtdipu.firebaseapp.com",
            projectId: "top300-rtdipu",
            storageBucket: "top300-rtdipu.firebasestorage.app",
            messagingSenderId: "813008875330",
            appId: "1:813008875330:web:e550ad591091facc46a2db"));
  } else {
    await Firebase.initializeApp();
  }
}
