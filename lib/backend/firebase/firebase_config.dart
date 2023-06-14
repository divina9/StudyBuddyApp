import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBYIG-caUb53N_dyhcijDy9N7GigKA6pZ8",
            authDomain: "studybuddy-7b1a8.firebaseapp.com",
            projectId: "studybuddy-7b1a8",
            storageBucket: "studybuddy-7b1a8.appspot.com",
            messagingSenderId: "1056449833040",
            appId: "1:1056449833040:web:d98855b56a25c5f23ec955",
            measurementId: "G-44JZ5Q6CPS"));
  } else {
    await Firebase.initializeApp();
  }
}
