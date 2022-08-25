import 'package:hive_flutter/hive_flutter.dart';
part 'task_category_model.g.dart';

@HiveType(typeId: 1)
class TaskCategoryModel {
  @HiveField(0)
  int? idCategory;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int icon;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final int bgColor;

  @HiveField(5)
  final int iconColor;
  TaskCategoryModel({
    this.idCategory,
    required this.icon,
    required this.title,
    required this.description,
    required this.bgColor,
    required this.iconColor,
  });
}
