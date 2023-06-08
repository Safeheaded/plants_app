import 'package:am_project/models/book.dart';
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
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    var addBookState = BookState.wantToRead;

    if (_activeIndex == 1) {
      addBookState = BookState.reading;
    } else if (_activeIndex == 2) {
      addBookState = BookState.read;
    }

    return AutoTabsScaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(SearchBooksRoute(bookState: addBookState));
        },
        child: const Icon(Icons.search),
      ),
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
      routes: const [ToReadTabRoute(), ReadingTabRoute(), ReadTabRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'To Read'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Reading'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Read'),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: (activeIndex) {
            tabsRouter.setActiveIndex(activeIndex);
            setState(() {
              _activeIndex = activeIndex;
            });
          },
        );
      },
    );
  }
}
