import 'package:am_project/models/db_user.dart';
import 'package:am_project/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class UserProvider with ChangeNotifier {
  final UserRepository _userRepository;
  UserProvider(@Named('UserService') this._userRepository);

  DBUser? _user;

  DBUser? get user => _user;

  Future<void> getUser() async {
    _user = await _userRepository.getUser();
    notifyListeners();
  }
}
