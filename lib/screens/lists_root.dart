import 'package:am_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as p;

import '../providers/user_provider.dart';

class ListsRoot extends StatefulWidget {
  const ListsRoot({super.key});

  @override
  State<ListsRoot> createState() => _ListsRootState();
}

class _ListsRootState extends State<ListsRoot> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final widgetOptions = <Widget>[
      Text(
          p.Provider.of<UserProvider>(context, listen: true).user?.email ?? ''),
      const Text(
        'Index 1: Profile',
      ),
      const Text(
        'Index 2: Profile',
      ),
    ];

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
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.account_circle),
            )
          ],
          title: const Text('Plants List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'To Read',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.auto_stories), label: 'Being Read'),
            BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Read')
          ],
        ),
        body: Column(children: [
          Center(child: widgetOptions?.elementAt(_selectedIndex)),
          ElevatedButton(onPressed: handleLogout, child: const Text('Logout'))
        ]));
  }
}
