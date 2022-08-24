import 'package:flutter/material.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/controllers/category_db_controller.dart';
import 'package:roster_co/widgets/tasks/category/task_category_card_widget.dart';

// ignore: must_be_immutable
class TaskCategoryWidget extends StatefulWidget {
  const TaskCategoryWidget({Key? key}) : super(key: key);

  @override
  State<TaskCategoryWidget> createState() => _TaskCategoryWidgetState();
}

class _TaskCategoryWidgetState extends State<TaskCategoryWidget> {
  final CategoryDbController _categorList = CategoryDbController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: (_categorList.categoryDb.isEmpty)
          ? const Center(child: Text('No task categories'))
          : GridView.builder(
              physics: sPhysics,
              itemCount: _categorList.categoryDb.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return TaskCategoryCard(index: index);
              },
            ),
    );
  }
}
