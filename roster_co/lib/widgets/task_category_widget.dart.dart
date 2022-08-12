import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roster_co/constants/color_consts.dart';
import 'package:roster_co/models/task.dart';

class TaskCategoryWidget extends StatelessWidget {
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
  ColorList bdColors = ColorList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          return _buildTask(context, task[0], index);
        },
      ),
    );
  }

  Widget _buildTask(BuildContext context, TaskModel task, int index) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bdColors.bgColor[index],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
