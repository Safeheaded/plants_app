import 'package:am_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CurrentlyReadingList extends StatelessWidget {
  const CurrentlyReadingList({super.key});

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: handleLogout,
        child: const Text('Logout'),
      )),
    );
  }
}
