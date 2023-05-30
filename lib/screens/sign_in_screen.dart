import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = emailController.text;
    final password = passwordController.text;
    setState(() {
      _isLoading = true;
    });
    try {
      await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);
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
  void initState() {
    if (context.mounted) {
      if (Supabase.instance.client.auth.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    }
    super.initState();
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
              onPressed: _handleLogin,
              style: const ButtonStyle(),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Login')),
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: ElevatedButton(
              onPressed: () {
                context.go('/signUp');
              },
              style: const ButtonStyle(),
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Create Account')),
        )
      ],
    )));
  }
}
