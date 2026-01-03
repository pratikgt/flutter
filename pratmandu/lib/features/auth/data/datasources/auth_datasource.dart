import 'package:pratmandu/features/auth/data/models/auth_hive_model.dart';

abstract interface class IAuthDataSource {
  Future<void> register(AuthHiveModel user);

  Future<AuthHiveModel?> login({
    required String email,
    required String password,
  });

  Future<AuthHiveModel?> getCurrentUser();

  Future<bool> logout();

  Future<AuthHiveModel?> getUserByEmail(String email);
}
