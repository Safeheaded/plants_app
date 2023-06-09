import 'package:am_project/classes/shallow_book.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddReadBookScreen extends StatefulWidget {
  final ShallowBook shallowBook;
  const AddReadBookScreen({super.key, required this.shallowBook});

  @override
  State<AddReadBookScreen> createState() => _AddReadBookScreenState();
}

class _AddReadBookScreenState extends State<AddReadBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Read Book')),
        body: const Text('AddReadBookScreen'));
  }
}
