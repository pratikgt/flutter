import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pratmandu/core/constants/hive_table_constant.dart';
import 'package:pratmandu/features/user/data/models/user_hive_model.dart';

final userLocalDatasourceProvider = Provider<UserLocalDatasource>((ref) {
  return UserLocalDatasource();
});

class UserLocalDatasource {
  Future<Box<UserHiveModel>> _userBox() async {
    return Hive.openBox<UserHiveModel>(HiveTableConstant.userTable);
  }

  Future<UserHiveModel?> getUserById(String userId) async {
    final box = await _userBox();
    return box.get(userId);
  }

  Future<void> saveOrUpdateUser(UserHiveModel user) async {
    final box = await _userBox();

    // Use user.id as the ONLY key for the user object
    // (prevents the “same instance stored with two different keys” issue)
    await box.put(user.id, user);
  }

  Future<void> deleteUser(String userId) async {
    final box = await _userBox();
    await box.delete(userId);
  }
}
