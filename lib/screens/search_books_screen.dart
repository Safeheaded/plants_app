import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/providers/books_provider.dart';
import 'package:am_project/providers/open_library_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SearchBooksScreen extends StatefulWidget {
  final BookState bookState;
  const SearchBooksScreen({super.key, required this.bookState});

  @override
  State<SearchBooksScreen> createState() => _SearchBooksScreenState();
}

class _SearchBooksScreenState extends State<SearchBooksScreen> {
  final TextEditingController _bookTitleController = TextEditingController();
  late Future<void> _getData;

  @override
  void dispose() {
    _bookTitleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _getData = context
        .read<OpenLibraryProvider>()
        .searchBooks(_bookTitleController.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<OpenLibraryProvider>(context).books;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ${widget.bookState.toString().split('.').last} book'),
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
                  setState(() {
                    _getData = context
                        .read<OpenLibraryProvider>()
                        .searchBooks(_bookTitleController.text);
                  });
                },
                icon: const Icon(Icons.search)),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: _bookTitleController.text.isEmpty
                ? null
                : FutureBuilder(
                    future: _getData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
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
                                onTap: () {
                                  final currentBook = books[index];
                                  final shallowBook = ShallowBook(
                                      currentBook.title,
                                      currentBook.author,
                                      'https://covers.openlibrary.org/b/id/${books[index].coverI}-M.jpg',
                                      widget.bookState);
                                  context
                                      .read<BooksProvider>()
                                      .addBook(shallowBook);
                                  context.router.pop();
                                },
                              );
                            });
                      } else if (snapshot.hasError) {
                        return const Text('An Error Ocurred');
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
          ),
        )
      ]),
    );
  }
}
