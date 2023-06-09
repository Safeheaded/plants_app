import 'package:am_project/main.dart';
import 'package:am_project/providers/books_provider.dart';
import 'package:am_project/providers/open_library_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider.value(value: getIt<OpenLibraryProvider>()),
          ListenableProvider.value(value: getIt<BooksProvider>())
        ],
        builder: (context, _) => Scaffold(
              body: FutureBuilder(
                future: context.read<BooksProvider>().getAllBooks(), 
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const AutoRouter();  
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }     
                },
              ),
            ));
  } 
}
