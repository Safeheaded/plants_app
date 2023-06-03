// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'root_router.dart';

abstract class _$RootRouter extends RootStackRouter {
  // ignore: unused_element
  _$RootRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BooksListsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BooksListsScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    ReadingTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReadingTabScreen(),
      );
    },
    ReadTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReadTabScreen(),
      );
    },
  };
}

/// generated route for
/// [BooksListsScreen]
class BooksListsRoute extends PageRouteInfo<void> {
  const BooksListsRoute({List<PageRouteInfo>? children})
      : super(
          BooksListsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BooksListsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReadingTabScreen]
class ReadingTabRoute extends PageRouteInfo<void> {
  const ReadingTabRoute({List<PageRouteInfo>? children})
      : super(
          ReadingTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReadingTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReadTabScreen]
class ReadTabRoute extends PageRouteInfo<void> {
  const ReadTabRoute({List<PageRouteInfo>? children})
      : super(
          ReadTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReadTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
