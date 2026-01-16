import 'package:hive/hive.dart';
import 'package:pratmandu/core/constants/hive_table_constant.dart';
import 'package:pratmandu/features/user/domain/entities/user_entity.dart';

part 'user_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTypeId)
class UserHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String fullName;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? phone;

  // Local authentication field
  @HiveField(4)
  final String password;

  UserHiveModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    required this.password,
  });

  UserEntity toEntity() => UserEntity(
        id: id,
        fullName: fullName,
        email: email,
        phone: phone,
      );

  static UserHiveModel fromEntity(UserEntity entity,
      {required String password}) {
    return UserHiveModel(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      phone: entity.phone,
      password: password,
    );
  }
}
