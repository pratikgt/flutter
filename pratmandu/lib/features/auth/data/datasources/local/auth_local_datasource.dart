import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../models/auth_hive_model.dart';
import '../auth_datasource.dart';

final authLocalDatasourceProvider = Provider<IAuthDataSource>((ref) {
  return AuthLocalDatasource();
});

class AuthLocalDatasource implements IAuthDataSource {
  static const String usersBoxName = 'usersBox';
  static const String currentUserKey = 'currentUser';

  @override
  Future<void> register(AuthHiveModel user) async {
    final box = await Hive.openBox<AuthHiveModel>(usersBoxName);
    await box.put(user.email.toLowerCase(), user);
    await box.put(currentUserKey, user);
  }

  @override
  Future<AuthHiveModel?> login({
    required String email,
    required String password,
  }) async {
    final box = await Hive.openBox<AuthHiveModel>(usersBoxName);
    final user = box.get(email.toLowerCase());

    if (user == null) return null;
    if (user.password != password) return null;

    await box.put(currentUserKey, user);
    return user;
  }

  @override
  Future<AuthHiveModel?> getCurrentUser() async {
    final box = await Hive.openBox<AuthHiveModel>(usersBoxName);
    return box.get(currentUserKey);
  }

  @override
  Future<bool> logout() async {
    final box = await Hive.openBox<AuthHiveModel>(usersBoxName);
    await box.delete(currentUserKey);
    return true;
  }

  @override
  Future<AuthHiveModel?> getUserByEmail(String email) async {
    final box = await Hive.openBox<AuthHiveModel>(usersBoxName);
    return box.get(email.toLowerCase());
  }
}
