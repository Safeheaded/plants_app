import 'package:flutter/material.dart';

class AuthenticateForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback? handleFormSubmit;
  final String buttonLabel;
  const AuthenticateForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      this.isLoading = false,
      this.handleFormSubmit,
      this.buttonLabel = 'Login'});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
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
              onPressed: handleFormSubmit,
              style: const ButtonStyle(),
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Text(buttonLabel)),
        ),
      ],
    );
  }
}
