import 'package:auto_route/auto_route.dart';

import '../screens/login_screen.dart';
import '../screens/books_lists_screen.dart';
import '../screens/splash_screen.dart';
import 'auth_guard.dart';
part 'root_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class RootRouter extends _$RootRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: BooksListsRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: SplashRoute.page, initial: true)
      ];
}
