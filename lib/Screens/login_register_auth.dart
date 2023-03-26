import 'package:flutter/material.dart';

import 'loginscreen.dart';
import 'sign_up_screen.dart';

class LoginRegisterAuth extends StatefulWidget {
  const LoginRegisterAuth({Key? key}) : super(key: key);

  @override
  State<LoginRegisterAuth> createState() => _LoginRegisterAuthState();
}

class _LoginRegisterAuthState extends State<LoginRegisterAuth> {
  bool showLogpage = true;

  void changePage() {
    setState(() {
      showLogpage = !showLogpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogpage) {
      return const LoginScreen();
    } else {
      return const SignUp();
    }
  }
}
