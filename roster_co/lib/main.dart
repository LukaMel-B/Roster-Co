import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:roster_co/db/functions/category_db_functions.dart';
import 'package:roster_co/db/models/task_category_model.dart';
import 'package:roster_co/screens/home/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskCategoryModelAdapter());
  await Hive.openBox<TaskCategoryModel>('category_db');
  await getAllCategorys();
  //clearAllCategorys();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomeScreen(),
      theme: ThemeData(
        fontFamily: 'Metropolis',
        primaryColor: Colors.black,
      ),
    );
  }
}
