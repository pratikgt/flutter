import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/features/auth/domain/repositories/auth_repository.dart';
import 'package:pratmandu/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pratmandu/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:pratmandu/features/auth/data/datasources/remote/auth_remote_datasource.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = ref.read(authRemoteDatasourceProvider);
  final local = ref.read(authLocalDatasourceProvider);
  return AuthRepositoryImpl(remote: remote, local: local);
});
