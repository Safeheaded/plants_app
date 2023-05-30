import 'package:am_project/widgets/sign_in.dart';
import 'package:am_project/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoginScreen = true;

  @override
  Widget build(BuildContext context) {
    Widget toggleLoginButton = _isLoginScreen
        ? TextButton(
            onPressed: () {
              setState(() {
                _isLoginScreen = false;
              });
            },
            child: const Text('Create new account'))
        : TextButton(
            onPressed: () {
              setState(() {
                _isLoginScreen = true;
              });
            },
            child: const Text('Already have an account?'),
          );
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isLoginScreen ? const SignIn() : const SignUp(),
          toggleLoginButton
        ],
      )),
    );
  }
}
