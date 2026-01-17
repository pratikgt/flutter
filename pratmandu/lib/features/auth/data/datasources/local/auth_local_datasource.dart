import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthLocalDatasource {
  static const _authBox = 'auth';

  Future<void> saveToken(String token) async {
    final box = await Hive.openBox(_authBox);
    await box.put('token', token);
  }

  Future<String?> getToken() async {
    final box = await Hive.openBox(_authBox);
    return box.get('token');
  }

  Future<void> logout() async {
    final box = await Hive.openBox(_authBox);
    await box.clear();
  }
}

final authLocalDatasourceProvider = Provider<AuthLocalDatasource>((ref) {
  return AuthLocalDatasource();
});
