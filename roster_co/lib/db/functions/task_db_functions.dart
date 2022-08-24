// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:hive_flutter/hive_flutter.dart';
import 'package:roster_co/controllers/create_task_db_controller.dart';
import 'package:roster_co/db/models/task_create_model.dart';

TaskDbController taskList = TaskDbController();
Future<void> addTask(CreateTaskModel value, int categoryId) async {
  final taskDb = await Hive.openBox<CreateTaskModel>('task_db');
  final id = await taskDb.add(value);
  value.idTask = id;
  await taskDb.put(id, value);
  taskList.addToList(value);

  getAllTasks();
}

Future<void> getAllTasks() async {
  final taskDB = await Hive.openBox<CreateTaskModel>('task_db');
  taskList.taskDbList.clear();
  taskList.addAllToList(taskDB.values);
  // taskListNotifier.value.sort((a, b) {
  //   return a.rollNo.toLowerCase().compareTo(b.rollNo.toLowerCase());
  // });
}

Future<void> clearAllTasks() async {
  final taskDB = await Hive.openBox<CreateTaskModel>('task_db');
  taskList.taskDbList.clear();
  taskDB.clear();
}

Future<void> deleteTask(int id) async {
  final taskDB = await Hive.openBox<CreateTaskModel>('task_db');
  taskDB.delete(id);
  getAllTasks();
}
