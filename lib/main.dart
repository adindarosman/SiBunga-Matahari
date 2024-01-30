import 'package:SiBunga/core/core.dart';
import 'package:SiBunga/screens/login_signup/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(AppWidget());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB3te-Wf8Oiz8Ord5nljdfzh9os-P2PRKE",
      appId: "1:573713430790:web:a5f0b4b08f40db78184687",
      messagingSenderId: "573713430790",
      projectId: "anak-mude",
      // Your web Firebase config options
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SI BUNGA MATAHARI',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => AppWidget(),
        '/login': (context) => LoginPage()
      },
    );
  }
}
