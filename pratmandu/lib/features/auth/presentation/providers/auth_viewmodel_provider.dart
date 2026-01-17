import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/features/auth/presentation/providers/auth_provider.dart';
import 'package:pratmandu/features/auth/presentation/state/auth_state.dart';
import 'package:pratmandu/features/auth/presentation/view_model/auth_viewmodel.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthViewModel(authRepository);
});
