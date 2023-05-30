import 'package:am_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlantsList extends StatelessWidget {
  const PlantsList({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> handleLogout() async {
      await Supabase.instance.client.auth.signOut();
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plants List'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: handleLogout,
        child: const Text('Logout'),
      )),
    );
  }
}
