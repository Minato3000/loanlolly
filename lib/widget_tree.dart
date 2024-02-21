import 'package:flutter/material.dart';
import 'package:loanlolly/authentication/auth.dart';
import 'package:loanlolly/authentication/login_screen.dart';
import 'package:loanlolly/screens/home_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return HomeScreen();
        } else {
          return const LoginScreen();
        }
      });
  }
}