import 'package:am_project/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BooksListsScreen extends StatefulWidget {
  const BooksListsScreen({super.key});

  @override
  State<BooksListsScreen> createState() => _BooksListsScreenState();
}

class _BooksListsScreenState extends State<BooksListsScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final widgetOptions = <Widget>[
      const Text(''),
      const Text(
        'Index 1: Profile',
      ),
      const Text(
        'Index 2: Profile',
      ),
    ];

    Future<void> handleLogout() async {
      await supabase.auth.signOut();
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
        floatingActionButton: const FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
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
          Center(child: widgetOptions.elementAt(_selectedIndex)),
          ElevatedButton(onPressed: handleLogout, child: const Text('Logout'))
        ]));
  }
}
