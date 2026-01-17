import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dartz/dartz.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/core/usecases/app_usecases.dart';
import 'package:pratmandu/features/user/domain/entities/user_entity.dart';
import 'package:pratmandu/features/user/domain/repositories/user_repository.dart';
import 'package:pratmandu/features/user/data/repositories/user_repository_impl.dart';

final getUserProfileUsecaseProvider = Provider<GetUserProfileUsecase>((ref) {
  final repo = ref.read(userRepositoryProvider);
  return GetUserProfileUsecase(userRepository: repo);
});

class GetUserProfileUsecase implements UsecaseWithParms<UserEntity, String> {
  final IUserRepository userRepository;

  GetUserProfileUsecase({required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(String userId) {
    return userRepository.getProfile(userId);
  }
}
