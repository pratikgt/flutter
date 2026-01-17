import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/features/user/data/datasources/user_local_datasource.dart';
import 'package:pratmandu/features/user/domain/entities/user_entity.dart';
import 'package:pratmandu/features/user/domain/repositories/user_repository.dart';
import 'package:pratmandu/features/user/data/models/user_hive_model.dart';

final userRepositoryProvider = Provider<IUserRepository>((ref) {
  final ds = ref.read(userLocalDatasourceProvider);
  return UserRepositoryImpl(userLocalDatasource: ds);
});

class UserRepositoryImpl implements IUserRepository {
  final UserLocalDatasource userLocalDatasource;

  UserRepositoryImpl({required this.userLocalDatasource});

  @override
  Future<Either<Failure, UserEntity>> getProfile(String userId) async {
    try {
      final user = await userLocalDatasource.getUserById(userId);
      if (user == null) {
        return Left(
          LocalDatabaseFailure(message: "User not found"),
        );
      }
      return Right(user.toEntity());
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> updateProfile(UserEntity user) async {
    try {
      final existing = await userLocalDatasource.getUserById(user.id);
      if (existing == null) {
        return Left(
          LocalDatabaseFailure(message: "User not found"),
        );
      }

      final updated = UserHiveModel(
        id: user.id,
        fullName: user.fullName,
        email: user.email,
        phone: user.phone,
        password: existing.password,
      );

      await userLocalDatasource.saveOrUpdateUser(updated);
      return const Right(true);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }
}
