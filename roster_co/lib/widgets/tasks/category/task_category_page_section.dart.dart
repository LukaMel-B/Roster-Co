import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/widgets/tasks/category/task_category_card_widget.dart';

// ignore: must_be_immutable
class TaskCategoryWidget extends GetView {
  TaskCategoryWidget({Key? key}) : super(key: key);

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
          return _buildTask(context, index);
        },
      ),
    );
  }

  Widget _buildTask(BuildContext context, int index) {
    return TaskCategoryCard(index: index);
  }
}
