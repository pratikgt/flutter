import 'package:dartz/dartz.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/features/auth/data/models/auth_hive_model.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, bool>> register({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthHiveModel>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthHiveModel>> getCurrentUser();

  Future<Either<Failure, bool>> logout();
}
