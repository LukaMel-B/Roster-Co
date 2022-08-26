// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:roster_co/controllers/category_db_controller.dart';
import 'package:roster_co/db/models/task_category_model.dart';

CategoryDbController categoryList = Get.put(CategoryDbController());

Future<void> addCategory(TaskCategoryModel value) async {
  final categoryDb = await Hive.openBox<TaskCategoryModel>('category_db');
  final id = await categoryDb.add(value);
  value.idCategory = id;
  await categoryDb.put(id, value);
  await getAllCategorys();
}

Future<void> getAllCategorys() async {
  final categoryDb = await Hive.openBox<TaskCategoryModel>('category_db');

  categoryList.categoryDb.clear();
  categoryList.addAllToList(categoryDb.values);

  // CategoryListNotifier.value.sort((a, b) {
  //   return a.rollNo.toLowerCase().compareTo(b.rollNo.toLowerCase());
  // });
}

Future<void> clearAllCategorys() async {
  final categoryDb = await Hive.openBox<TaskCategoryModel>('category_db');
  categoryList.categoryDb.clear();
  categoryDb.clear();
}

Future<void> deleteCategory(int id) async {
  final categoryDb = await Hive.openBox<TaskCategoryModel>('category_db');
  categoryDb.delete(id);
  getAllCategorys();
}

Future<void> editCategory(TaskCategoryModel taskData, int id) async {
  final categoryDb = await Hive.openBox<TaskCategoryModel>('category_db');
  categoryDb.put(id, taskData);
  getAllCategorys();
}
