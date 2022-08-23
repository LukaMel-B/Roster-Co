import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/models/task.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/widgets/tasks/category/task_category_card_widget.dart';

// ignore: must_be_immutable
class TaskCategoryWidget extends GetView {
  TaskCategoryWidget({Key? key}) : super(key: key);
  final task = [
    TaskModel(
      bgColor: const Color(0xffFEF7E9),
      iconColor: const Color(0xffFECA90),
      taskNo: '3',
      icon: FontAwesomeIcons.solidUser,
      title: 'Personal',
    )
  ];

  TaskCategoryTitle title = TaskCategoryTitle();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: GridView.builder(
        physics: sPhysics,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return _buildTask(context, task[0], index);
        },
      ),
    );
  }

  Widget _buildTask(BuildContext context, TaskModel task, int index) {
    return TaskCategoryCard(index: index);
  }
}
