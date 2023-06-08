import 'package:am_project/providers/books_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ToReadTabScreen extends StatefulWidget {
  const ToReadTabScreen({super.key});

  @override
  State<ToReadTabScreen> createState() => _ToReadTabScreenState();
}

class _ToReadTabScreenState extends State<ToReadTabScreen> {
  @override
  Widget build(BuildContext context) {
    final toReadBooks = context.watch<BooksProvider>().wantToReadBooks;
    return ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                context.read<BooksProvider>().deleteBook(toReadBooks[index].id);
              } else {
                context
                    .read<BooksProvider>()
                    .moveToReading(toReadBooks[index].id);
              }
            },
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
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Move to Reading',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                    ],
                  )),
            ),
            key: ValueKey(toReadBooks[index].id),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(toReadBooks[index].coverUrl)),
              title: Text(toReadBooks[index].title),
              subtitle: Text(toReadBooks[index].author),
            ),
          );
        },
        itemCount: toReadBooks.length);
  }
}
