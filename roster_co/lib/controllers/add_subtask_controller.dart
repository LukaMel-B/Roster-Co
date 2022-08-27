import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roster_co/db/models/sub_task_model.dart';

class AddTaskController extends GetxController {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  List<Widget> subTasks = [];
  double idsubTask = 1000000000000099949986540584949514240;
  final boxSubtask = GetStorage();
  final List<TextEditingController> controllers = [];
  int count = 0;
  int controllerIndex = -1;
  List<SubTaskModel> subTaskList = [];
  IconData iconPriority = Icons.priority_high_rounded;
  String priorityValue = 'Medium';
  var itemsPriority = [
    'High',
    'Medium',
    'Low',
  ];
  String snoozeValue = '5 Minutes';
  var itemsSnooze = [
    '5 Minutes',
    '10 Minutes',
    '15 Minutes',
    '30 Minutes',
    '45 Minutes',
    '1 Hour',
  ];

  updatePriortiy(String? newValue) {
    priorityValue = newValue!;
    switch (newValue) {
      case 'High':
        iconPriority = CupertinoIcons.flame;
        break;
      case 'Medium':
        iconPriority = Icons.thumb_up_off_alt_outlined;
        break;
      case 'Low':
        iconPriority = FontAwesomeIcons.temperatureEmpty;
        break;
      default:
    }
    update();
  }

  addController(TextEditingController controller) {
    controllerIndex++;
    controllers.add(controller);
    boxSubtask.write('isSubTask', idsubTask);
    final newTask = SubTaskModel(
      idSubTask: idsubTask,
      subTask: controllers[controllerIndex].text.trim(),
      isDone: false,
      isDelete: false,
    );
    subTaskList.add(newTask);
    print(subTaskList.length);
    idsubTask--;
    boxSubtask.write('isSubTask', idsubTask);
    update();
  }

  updateCount() {
    count++;
    update();
  }

  resetCount() {
    count = 0;
    priorityValue = 'Medium';
    iconPriority = Icons.priority_high_rounded;
    controllerIndex = -1;
    controllers.clear();
    subTaskList.clear();
    subTasks.clear();
    descController.clear();
    titleController.clear();
    update();
  }
}
