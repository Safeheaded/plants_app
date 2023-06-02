import 'package:am_project/main.dart';
import 'package:injectable/injectable.dart';
import '../models/db_user.dart';

@Injectable()
class UserRepository {
  Future<DBUser?> getUser() async {
    final data = await supabase
        .from('users')
        .select('*')
        .eq('user_id', supabase.auth.currentUser!.id);
    return DBUser.fromJson(data[0]);
  }
}
