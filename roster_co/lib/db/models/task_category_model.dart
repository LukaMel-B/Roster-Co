import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class TaskCategoryModel {
  @HiveField(0)
  int? idCategory;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final IconData icon;

  TaskCategoryModel({
    this.idCategory,
    required this.icon,
    required this.title,
  });
}
