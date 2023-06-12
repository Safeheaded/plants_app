import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/providers/books_provider.dart';
import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ReadingTabScreen extends StatefulWidget {
  const ReadingTabScreen({super.key});

  @override
  State<ReadingTabScreen> createState() => _ReadingTabScreenState();
}

class _ReadingTabScreenState extends State<ReadingTabScreen> {
  @override
  Widget build(BuildContext context) {
    final readingBooks = context.watch<BooksProvider>().readingBooks;
    return ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              alignment: Alignment.centerLeft,
              color: Colors.red,
              child: Container(
                  margin: const EdgeInsets.only(left: 15.0),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              color: Colors.blue,
              child: Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(right: 15.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Move to Read',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            ),
            key: UniqueKey(),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                context
                    .read<BooksProvider>()
                    .deleteBook(readingBooks[index].id);
              } else {
                final selectedBook = readingBooks[index];
                final shallow = ShallowBook(
                    selectedBook.title,
                    selectedBook.author,
                    selectedBook.coverUrl,
                    selectedBook.state);
                context.router.push(AddReadBookRoute(
                    shallowBook: shallow, id: selectedBook.id));
              }
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(readingBooks[index].coverUrl),
              ),
              title: Text(readingBooks[index].title),
              subtitle: Text(readingBooks[index].author),
            ),
          );
        },
        itemCount: readingBooks.length);
  }
}
