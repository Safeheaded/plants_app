// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:am_project/providers/user_provider.dart' as _i5;
import 'package:am_project/repositories/user_repository.dart' as _i3;
import 'package:am_project/services/user_service.dart' as _i4;
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
    gh.factory<_i3.UserRepository>(
      () => _i4.UserService(),
      instanceName: 'UserService',
    );
    gh.singleton<_i5.UserProvider>(
        _i5.UserProvider(gh<_i3.UserRepository>(instanceName: 'UserService')));
    return this;
  }
}
