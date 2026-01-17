import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:pratmandu/app.dart';
import 'package:pratmandu/core/constants/hive_table_constant.dart';
import 'package:pratmandu/features/user/data/models/user_hive_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  if (!Hive.isAdapterRegistered(HiveTableConstant.userTypeId)) {
    Hive.registerAdapter(UserHiveModelAdapter());
  }

  // Open required boxes
  await Hive.openBox<UserHiveModel>(HiveTableConstant.userTable);

  runApp(const ProviderScope(child: App()));
}
