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
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDatasource {
  Future<String?> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final http.Client client;

  static const String _baseUrl = 'http://localhost:3000/api/v1/students';

  AuthRemoteDatasourceImpl({required this.client});

  @override
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    final response = await client.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      return decoded['token'];
    }
    return null;
  }
}

final authRemoteDatasourceProvider = Provider<AuthRemoteDatasource>((ref) {
  return AuthRemoteDatasourceImpl(client: http.Client());
});
