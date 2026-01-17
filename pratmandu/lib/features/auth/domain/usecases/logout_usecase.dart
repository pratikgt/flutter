import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/core/error/failures.dart';
import 'package:pratmandu/core/usecases/app_usecases.dart';
import 'package:pratmandu/features/auth/domain/repositories/auth_repository.dart';
import 'package:pratmandu/features/auth/presentation/providers/auth_provider.dart';

// Provider
final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return LogoutUsecase(authRepository);
});

class LogoutUsecase implements UsecaseWithoutParms<Unit> {
  final AuthRepository _authRepository;

  LogoutUsecase(this._authRepository);

  @override
  Future<Either<Failure, Unit>> call() async {
    try {
      await _authRepository.logout();
      return const Right(unit);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: e.toString()));
    }
  }
}
