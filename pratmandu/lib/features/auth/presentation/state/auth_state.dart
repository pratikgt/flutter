class AuthState {
  final bool isLoading;
  final bool isLoggedIn;
  final String? error;

  const AuthState({
    required this.isLoading,
    required this.isLoggedIn,
    this.error,
  });

  /// Initial state (app just opened)
  factory AuthState.initial() {
    return const AuthState(
      isLoading: false,
      isLoggedIn: false,
      error: null,
    );
  }

  /// Helper to create a modified copy
  AuthState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error,
    );
  }
}
