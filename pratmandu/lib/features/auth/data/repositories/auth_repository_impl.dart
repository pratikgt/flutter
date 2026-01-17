import 'package:pratmandu/features/auth/domain/repositories/auth_repository.dart';
import 'package:pratmandu/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:pratmandu/features/auth/data/datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;
  final AuthLocalDatasource local;

  AuthRepositoryImpl({
    required this.remote,
    required this.local,
  });

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final token = await remote.login(
      email: email,
      password: password,
    );

    if (token != null) {
      await local.saveToken(token);
    }

    return token;
  }

  @override
  Future<void> logout() async {
    await local.logout();
  }
}
