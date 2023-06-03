import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ReadTabScreen extends StatefulWidget {
  const ReadTabScreen({super.key});

  @override
  State<ReadTabScreen> createState() => _ReadTabScreenState();
}

class _ReadTabScreenState extends State<ReadTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Text('Read Tab Screen');
  }
}
