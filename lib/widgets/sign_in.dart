import 'package:am_project/router/root_router.dart';
import 'package:am_project/widgets/authenticate_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
        context.router.replaceAll([const BooksListsRoute()]);
      }
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AuthenticateForm(
          emailController: emailController,
          passwordController: passwordController,
          isLoading: _isLoading,
          handleFormSubmit: _handleLogin,
        ),
      ],
    );
  }
}
