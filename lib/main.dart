import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loanlolly/widget_tree.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCX15ek7DdphOVLvwpQj39J-JaLfO0VWzk",
      authDomain: "com.example.loanlolly",
      projectId: "loanlolly-45c54",
      appId: "1:688974572258:android:cbe37305f164917a9dccbb",
      messagingSenderId: "",
    ),
  );
  runApp(LoanLollyApp());
}


class LoanLollyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WidgetTree(),
    );
  }
}