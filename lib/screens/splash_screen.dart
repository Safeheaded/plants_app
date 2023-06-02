import 'package:am_project/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../router/root_router.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (supabase.auth.currentSession == null) {
        context.router.replace(const LoginRoute());
      } else {
        context.router.replace(const BooksListsRoute());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
