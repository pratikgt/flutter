import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/features/auth/presentation/state/auth_state.dart';

import '../../domain/repositories/auth_repository.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthViewModel(this.authRepository) : super(AuthState.initial());

  /// LOGIN ACTION
  Future<void> login({
    required String email,
    required String password,
  }) async {
    // 1️⃣ set loading state
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      // 2️⃣ call repository
      final token = await authRepository.login(
        email: email,
        password: password,
      );

      // 3️⃣ login success
      if (token != null) {
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: true,
        );
      } else {
        // 4️⃣ unexpected failure
        state = state.copyWith(
          isLoading: false,
          error: 'Login failed',
        );
      }
    } catch (e) {
      // 5️⃣ error from backend / network
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// LOGOUT ACTION
  Future<void> logout() async {
    await authRepository.logout();
    state = AuthState.initial();
  }
}
