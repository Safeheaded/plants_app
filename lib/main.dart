import 'dart:async';

import 'package:am_project/injection.dart';
import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
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
  final _rootRouter = RootRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MaterialApp.router(
        routerConfig: _rootRouter.config(
            reevaluateListenable:
                ReevaluateListenable.stream(supabase.auth.onAuthStateChange)),
      ),
    );
  }
}
