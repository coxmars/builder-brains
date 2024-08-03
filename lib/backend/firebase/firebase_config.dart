import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC7E6aOoiIhEmODBfY1jwn-k0GmxrRbvsY",
            authDomain: "builderbrains.firebaseapp.com",
            projectId: "builderbrains",
            storageBucket: "builderbrains.appspot.com",
            messagingSenderId: "440476852275",
            appId: "1:440476852275:web:ab31a7051c5c46ff4fc346",
            measurementId: "G-DCQ593KQ6N"));
  } else {
    await Firebase.initializeApp();
  }
}
