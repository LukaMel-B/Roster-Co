import 'package:roster_co/db/models/sub_task_model.dart';

class CreateTaskModel {
  final String title;
  final String date;
  final String priority;
  final String description;
  final String time;
  final int snooze;
  final SubTaskModel subTask;

  CreateTaskModel(this.title, this.date, this.priority, this.description,
      this.time, this.snooze, this.subTask);
}
