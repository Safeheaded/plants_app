import 'package:am_project/providers/open_library_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SearchBooksScreen extends StatefulWidget {
  const SearchBooksScreen({super.key});

  @override
  State<SearchBooksScreen> createState() => _SearchBooksScreenState();
}

class _SearchBooksScreenState extends State<SearchBooksScreen> {
  final TextEditingController _bookTitleController = TextEditingController();

  @override
  void dispose() {
    _bookTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<OpenLibraryProvider>(context).books;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Books'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
                child: TextField(
              controller: _bookTitleController,
            )),
            IconButton(
                onPressed: () {
                  Provider.of<OpenLibraryProvider>(context, listen: false)
                      .searchBooks(_bookTitleController.text);
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(books[index].title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://covers.openlibrary.org/b/id/${books[index].coverI}-M.jpg'),
                    ),
                  );
                }),
          ),
        )
      ]),
    );
  }
}
