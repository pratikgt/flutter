import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pratmandu/features/user/data/models/user_hive_model.dart';

final hiveServiceProvider = Provider<HiveService>((ref) {
  return HiveService();
});

class HiveService {
  Future<void> init() async {
    await Hive.initFlutter();

    // Register ONLY User adapter
    if (!Hive.isAdapterRegistered(UserHiveModelAdapter().typeId)) {
      Hive.registerAdapter(UserHiveModelAdapter());
    }

    // Open user box
    await Hive.openBox<UserHiveModel>('usersBox');
  }

  Future<void> close() async {
    await Hive.close();
  }
}
