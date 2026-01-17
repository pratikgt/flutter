// class ApiConstants {
//   static const String baseUrl = "http://10.0.2.2:3000/api/v1";
//   static const String signup = "/students";
//   static const String login = "/students/login";
// }
import 'package:flutter/foundation.dart';

class ApiConstants {
  /// ===============================
  /// BASE URL
  /// ===============================
  /// - Flutter Web  → localhost
  /// - Android Emulator → 10.0.2.2
  ///
  /// This is REQUIRED because browser and emulator
  /// run in different network environments.
  static String get baseUrl {
    if (kIsWeb) {
      return "http://localhost:3000/api/v1";
    } else {
      return "http://10.0.2.2:3000/api/v1";
    }
  }

  /// ===============================
  /// AUTH ENDPOINTS
  /// ===============================
  static const String login = "/students/login";
  static const String signup = "/students";

  /// ===============================
  /// OTHER ENDPOINTS (future use)
  /// ===============================
  static const String categories = "/categories";
  static const String items = "/items";
}
