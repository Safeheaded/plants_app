import 'package:am_project/main.dart';
import 'package:am_project/widgets/currently_reading_list.dart';
import 'package:am_project/widgets/authenticate_form.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          handleFormSubmit: _handleCreateNewAccount,
          buttonLabel: 'Create new account',
        )
      ],
    );
  }
}
