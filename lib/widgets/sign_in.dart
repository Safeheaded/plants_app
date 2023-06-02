import 'package:am_project/widgets/authenticate_form.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as p;

import '../providers/user_provider.dart';
import 'currently_reading_list.dart';

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
        p.Provider.of<UserProvider>(context, listen: false).getUser();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const CurrentlyReadingList()));
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
