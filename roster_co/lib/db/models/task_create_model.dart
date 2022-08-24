import 'package:roster_co/db/models/sub_task_model.dart';

class CreateTaskModel {
  int? idTask;
  final String title;
  final String date;
  final String category;
  final String priority;
  final String description;
  final String time;
  final int snooze;
  final SubTaskModel subTask;

  CreateTaskModel({
    this.idTask,
    required this.title,
    required this.date,
    required this.category,
    required this.priority,
    required this.description,
    required this.time,
    required this.snooze,
    required this.subTask,
  });
}
