// import 'dart:convert';
// import 'package:http/http.dart' as http;

// abstract class AuthRemoteDatasource {
//   /// Calls login API
//   /// Returns token on success, null on failure
//   Future<String?> login({
//     required String email,
//     required String password,
//   });
// }

// class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
//   final http.Client client;

//   static const String _baseUrl = 'https://your-api-url.com';

//   AuthRemoteDatasourceImpl({required this.client});

//   @override
//   Future<String?> login({
//     required String email,
//     required String password,
//   }) async {
//     final url = Uri.parse('$_baseUrl/auth/login');

//     final response = await client.post(
//       url,
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final decoded = jsonDecode(response.body);

//       // Expected response:
//       // { "token": "abc123" }
//       return decoded['token'] as String?;
//     } else {
//       return null;
//     }
//   }
// }

//for provider setupimport 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pratmandu/core/api/api_client.dart';
import 'package:pratmandu/core/api/api_endpoints.dart';
import 'package:pratmandu/core/providers/api_client_provider.dart';

/// ===============================
/// ABSTRACT DATASOURCE
/// ===============================
/// This defines WHAT the remote datasource can do,
/// not HOW it does it.
abstract class AuthRemoteDatasource {
  Future<String?> login({
    required String email,
    required String password,
  });
}

/// ===============================
/// IMPLEMENTATION
/// ===============================
/// This class talks to the backend using ApiClient.
/// It knows NOTHING about Hive or UI.
class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiClient apiClient;

  AuthRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final response = await apiClient.post(
      ApiEndpoints.login(),
      body: {
        'email': email,
        'password': password,
      },
    );

    return response['token'];
  }
}

/// ===============================
/// RIVERPOD PROVIDER
/// ===============================
/// This tells Riverpod how to create AuthRemoteDatasource
/// and inject ApiClient into it.
final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthRemoteDatasourceImpl(apiClient: apiClient);
});
