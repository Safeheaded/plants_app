import 'package:am_project/providers/books_provider.dart';
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
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(readingBooks[index].coverUrl),
            ),
            title: Text(readingBooks[index].title),
            subtitle: Text(readingBooks[index].author),
          );
        },
        itemCount: readingBooks.length);
  }
}
