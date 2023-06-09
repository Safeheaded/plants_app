import 'package:am_project/classes/shallow_book.dart';
import 'package:am_project/models/book.dart';
import 'package:am_project/screens/add_read_book.dart';
import 'package:am_project/screens/camera_screen.dart';
import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/books_lists_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/search_books_screen.dart';
import '../screens/tabs/reading_tab_screen.dart';
import '../screens/tabs/read_tab_screen.dart';
import '../screens/tabs/to_read_tab_screen.dart';
import 'auth_guard.dart';
part 'root_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class RootRouter extends _$RootRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: DashboardRoute.page, guards: [
          AuthGuard()
        ], children: [
          AutoRoute(initial: true, page: BooksListsRoute.page, children: [
            AutoRoute(page: ReadingTabRoute.page),
            AutoRoute(page: ReadTabRoute.page),
            AutoRoute(page: ToReadTabRoute.page)
          ]),
          AutoRoute(page: SearchBooksRoute.page),
          AutoRoute(page: AddReadBookRoute.page),
          AutoRoute(page: CameraRoute.page)
        ]),
        AutoRoute(page: SplashRoute.page, initial: true)
      ];
}
