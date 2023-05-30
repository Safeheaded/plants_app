import 'package:am_project/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleCreateNewAccount() async {
    final email = emailController.text;
    final password = passwordController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      await supabase.auth.signUp(email: email, password: password);
      if (context.mounted) {
        context.go('/');
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Email'),
          ),
        ),
        SizedBox(
          width: 300,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
          ),
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
              onPressed: _handleCreateNewAccount,
              style: const ButtonStyle(),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Register')),
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                context.go('/signIn');
              },
              style: const ButtonStyle(),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Already have an account? Sign in')),
        )
      ],
    )));
  }
}
