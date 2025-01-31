import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_scout_project/app/app.dart';


import 'app/di/di.dart';
import 'core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  await initDependencies();
  runApp(
    const MyApp(),
  );
}
