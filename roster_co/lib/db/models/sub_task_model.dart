import 'package:hive_flutter/hive_flutter.dart';
part 'sub_task_model.g.dart';

@HiveType(typeId: 3)
class SubTaskModel {
  @HiveField(0)
  final String subTask;

  @HiveField(1)
  final bool isDone;

  @HiveField(2)
  final bool isDelete;

  @HiveField(3)
  double? idSubTask;

  SubTaskModel(
      {this.idSubTask,
      required this.subTask,
      required this.isDone,
      required this.isDelete});
}
