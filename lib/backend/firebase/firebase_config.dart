import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCD0IiVB8_RUiU0ZaTpbziqmfuut-fD6R4",
            authDomain: "practica2accesibilidad-130f5.firebaseapp.com",
            projectId: "practica2accesibilidad-130f5",
            storageBucket: "practica2accesibilidad-130f5.firebasestorage.app",
            messagingSenderId: "906458187823",
            appId: "1:906458187823:web:03cfb0a9d6607cdecf9eda",
            measurementId: "G-W3VV3VBZWL"));
  } else {
    await Firebase.initializeApp();
  }
}
