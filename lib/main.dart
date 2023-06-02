import 'dart:async';

import 'package:am_project/injection.dart';
import 'package:am_project/providers/user_provider.dart';
import 'package:am_project/screens/lists_root.dart';
import 'package:am_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final getIt = GetIt.instance;

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] as String,
    anonKey: dotenv.env['SUPABASE_API_KEY'] as String,
  );
  configureDependencies();
  runApp(const AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (_) => getIt<UserProvider>()..getUser(),
      child: supabase.auth.currentSession != null
          ? const ListsRoot()
          : const LoginScreen(),
    ));
  }
}
