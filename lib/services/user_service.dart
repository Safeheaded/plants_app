import 'package:am_project/main.dart';
import 'package:am_project/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';
import '../models/db_user.dart';

@Named('UserService')
@Injectable(as: UserRepository)
class UserService implements UserRepository {
  @override
  Future<DBUser?> getUser() async {
    final data = await supabase
        .from('users')
        .select('*')
        .eq('user_id', supabase.auth.currentUser!.id);
    return DBUser.fromJson(data[0]);
  }
}
