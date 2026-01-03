import 'package:hive/hive.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: 1)
class AuthHiveModel extends HiveObject {
  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  AuthHiveModel({
    required this.email,
    required this.password,
  });
}
