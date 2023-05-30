import 'dart:async';

import 'package:am_project/screens/plants_list.dart';
import 'package:am_project/screens/sign_in_screen.dart';
import 'package:am_project/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] as String,
    anonKey: dotenv.env['SUPABASE_API_KEY'] as String,
  );
  runApp(const AppRoot());
}

final GoRouter _router = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: '/',
    builder: (context, state) => const PlantsList(),
    redirect: (context, state) {
      if (Supabase.instance.client.auth.currentUser == null) {
        return '/signIn';
      }
      return null;
    },
  ),
  GoRoute(
    path: '/signIn',
    builder: (context, state) => const SignInScreen(),
    redirect: (context, state) {
      if (Supabase.instance.client.auth.currentUser != null) {
        return '/';
      }
      return null;
    },
  ),
  GoRoute(
      path: '/signUp',
      builder: (context, state) => const SignUpScreen(),
      redirect: (context, state) {
        if (Supabase.instance.client.auth.currentUser != null) {
          return '/';
        }
        return null;
      }),
], initialLocation: '/');

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
