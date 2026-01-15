import 'package:hive/hive.dart';
import 'package:pratmandu/core/constants/hive_table_constant.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTypeId)
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
