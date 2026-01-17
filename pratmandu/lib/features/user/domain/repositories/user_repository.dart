import 'package:dartz/dartz.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/features/user/domain/entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserEntity>> getProfile(String userId);
  Future<Either<Failure, bool>> updateProfile(UserEntity user);
}
