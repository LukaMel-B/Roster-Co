import 'package:hive_flutter/hive_flutter.dart';
import 'package:roster_co/db/models/sub_task_model.dart';
part 'task_create_model.g.dart';

@HiveType(typeId: 2)
class CreateTaskModel {
  @HiveField(0)
  int? idTask;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String dueDate;

  @HiveField(3)
  final String priority;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String time;

  @HiveField(6)
  final int snooze;

  @HiveField(7)
  final List<SubTaskModel> subTasks;

  @HiveField(8)
  final String category;
  @HiveField(9)
  final String createDate;

  CreateTaskModel({
    this.idTask,
    required this.title,
    required this.dueDate,
    required this.createDate,
    required this.priority,
    required this.description,
    required this.time,
    required this.snooze,
    required this.subTasks,
    required this.category,
  });
}
