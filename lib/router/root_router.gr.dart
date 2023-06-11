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
    AddReadBookRoute.name: (routeData) {
      final args = routeData.argsAs<AddReadBookRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddReadBookScreen(
          key: args.key,
          shallowBook: args.shallowBook,
          id: args.id,
          latitude: args.latitude,
          longitude: args.longitude,
          imageUrl: args.imageUrl,
        ),
      );
    },
    BooksListsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BooksListsScreen(),
      );
    },
    CameraRoute.name: (routeData) {
      final args = routeData.argsAs<CameraRouteArgs>(
          orElse: () => const CameraRouteArgs());
      return AutoRoutePage<XFile>(
        routeData: routeData,
        child: CameraScreen(
          key: args.key,
          cameras: args.cameras,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginScreen(),
      );
    },
    SearchBooksRoute.name: (routeData) {
      final args = routeData.argsAs<SearchBooksRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchBooksScreen(
          key: args.key,
          bookState: args.bookState,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
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
    ToReadTabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ToReadTabScreen(),
      );
    },
    UserRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UserScreen(),
      );
    },
  };
}

/// generated route for
/// [AddReadBookScreen]
class AddReadBookRoute extends PageRouteInfo<AddReadBookRouteArgs> {
  AddReadBookRoute({
    Key? key,
    required ShallowBook shallowBook,
    int? id,
    double? latitude,
    double? longitude,
    String? imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
          AddReadBookRoute.name,
          args: AddReadBookRouteArgs(
            key: key,
            shallowBook: shallowBook,
            id: id,
            latitude: latitude,
            longitude: longitude,
            imageUrl: imageUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'AddReadBookRoute';

  static const PageInfo<AddReadBookRouteArgs> page =
      PageInfo<AddReadBookRouteArgs>(name);
}

class AddReadBookRouteArgs {
  const AddReadBookRouteArgs({
    this.key,
    required this.shallowBook,
    this.id,
    this.latitude,
    this.longitude,
    this.imageUrl,
  });

  final Key? key;

  final ShallowBook shallowBook;

  final int? id;

  final double? latitude;

  final double? longitude;

  final String? imageUrl;

  @override
  String toString() {
    return 'AddReadBookRouteArgs{key: $key, shallowBook: $shallowBook, id: $id, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl}';
  }
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
/// [CameraScreen]
class CameraRoute extends PageRouteInfo<CameraRouteArgs> {
  CameraRoute({
    Key? key,
    List<CameraDescription>? cameras,
    List<PageRouteInfo>? children,
  }) : super(
          CameraRoute.name,
          args: CameraRouteArgs(
            key: key,
            cameras: cameras,
          ),
          initialChildren: children,
        );

  static const String name = 'CameraRoute';

  static const PageInfo<CameraRouteArgs> page = PageInfo<CameraRouteArgs>(name);
}

class CameraRouteArgs {
  const CameraRouteArgs({
    this.key,
    this.cameras,
  });

  final Key? key;

  final List<CameraDescription>? cameras;

  @override
  String toString() {
    return 'CameraRouteArgs{key: $key, cameras: $cameras}';
  }
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
/// [SearchBooksScreen]
class SearchBooksRoute extends PageRouteInfo<SearchBooksRouteArgs> {
  SearchBooksRoute({
    Key? key,
    required BookState bookState,
    List<PageRouteInfo>? children,
  }) : super(
          SearchBooksRoute.name,
          args: SearchBooksRouteArgs(
            key: key,
            bookState: bookState,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchBooksRoute';

  static const PageInfo<SearchBooksRouteArgs> page =
      PageInfo<SearchBooksRouteArgs>(name);
}

class SearchBooksRouteArgs {
  const SearchBooksRouteArgs({
    this.key,
    required this.bookState,
  });

  final Key? key;

  final BookState bookState;

  @override
  String toString() {
    return 'SearchBooksRouteArgs{key: $key, bookState: $bookState}';
  }
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

/// generated route for
/// [ToReadTabScreen]
class ToReadTabRoute extends PageRouteInfo<void> {
  const ToReadTabRoute({List<PageRouteInfo>? children})
      : super(
          ToReadTabRoute.name,
          initialChildren: children,
        );

  static const String name = 'ToReadTabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserScreen]
class UserRoute extends PageRouteInfo<void> {
  const UserRoute({List<PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
