import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class BooksListsScreen extends StatefulWidget {
  const BooksListsScreen({super.key});

  @override
  State<BooksListsScreen> createState() => _BooksListsScreenState();
}

class _BooksListsScreenState extends State<BooksListsScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (context, tabsRouter) {
        return AppBar(
          title: const Text('Books Lists'),
          actions: const [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: null,
            ),
          ],
        );
      },
      routes: const [ReadingTabRoute(), ReadTabRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Reading'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Read'),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
