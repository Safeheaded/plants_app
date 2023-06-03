import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReadingTabScreen extends StatefulWidget {
  const ReadingTabScreen({super.key});

  @override
  State<ReadingTabScreen> createState() => _ReadingTabScreenState();
}

class _ReadingTabScreenState extends State<ReadingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Reading Tab Screen');
  }
}