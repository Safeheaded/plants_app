// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:am_project/providers/books_provider.dart' as _i9;
import 'package:am_project/providers/open_library_provider.dart' as _i10;
import 'package:am_project/providers/user_provider.dart' as _i11;
import 'package:am_project/repositories/books_repository.dart' as _i3;
import 'package:am_project/repositories/open_library_repository.dart' as _i5;
import 'package:am_project/repositories/user_repository.dart' as _i7;
import 'package:am_project/services/books_service.dart' as _i4;
import 'package:am_project/services/open_library_service.dart' as _i6;
import 'package:am_project/services/user_service.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.BooksRepository>(
      () => _i4.BooksService(),
      instanceName: 'BooksService',
    );
    gh.factory<_i5.OpenLibraryRepository>(
      () => _i6.OpenLibraryService(),
      instanceName: 'OpenLibraryService',
    );
    gh.factory<_i7.UserRepository>(
      () => _i8.UserService(),
      instanceName: 'UserService',
    );
    gh.singleton<_i9.BooksProvider>(_i9.BooksProvider(
        gh<_i3.BooksRepository>(instanceName: 'BooksService')));
    gh.singleton<_i10.OpenLibraryProvider>(_i10.OpenLibraryProvider(
        gh<_i5.OpenLibraryRepository>(instanceName: 'OpenLibraryService')));
    gh.singleton<_i11.UserProvider>(
        _i11.UserProvider(gh<_i7.UserRepository>(instanceName: 'UserService')));
    return this;
  }
}
