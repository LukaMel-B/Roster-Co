import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/widgets/tasks/category/task_category_page_section.dart.dart';

class MainTaskScreen extends GetView {
  const MainTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Tasks',
            style: TextStyle(
                color: Colors.black, fontSize: 21, fontFamily: 'Metropolis'),
          ),
        ),
        const SizedBox(height: 400, child: TaskCategoryWidget())
      ],
    );
  }
}
