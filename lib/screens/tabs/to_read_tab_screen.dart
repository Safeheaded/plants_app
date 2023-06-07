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
          return ListTile(
            leading: CircleAvatar(
                backgroundImage: NetworkImage(toReadBooks[index].coverUrl)),
            title: Text(toReadBooks[index].title),
            subtitle: Text(toReadBooks[index].author),
          );
        },
        itemCount: toReadBooks.length);
  }
}
