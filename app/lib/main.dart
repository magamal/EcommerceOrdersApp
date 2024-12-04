import 'package:app/src/app/my_app.dart';
import 'package:flutter/material.dart';
import 'package:di/di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

configureDependencies() async {
  await di.configureDependencies();
}
