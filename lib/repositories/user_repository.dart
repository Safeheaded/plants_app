import '../models/db_user.dart';

abstract class UserRepository {
  Future<DBUser?> getUser();
}
