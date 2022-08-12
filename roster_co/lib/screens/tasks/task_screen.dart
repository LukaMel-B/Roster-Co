import 'package:flutter/material.dart';
import 'package:roster_co/widgets/task_category_widget.dart.dart';

class MainTaskScreen extends StatelessWidget {
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
        SizedBox(height: 400, child: TaskCategoryWidget())
      ],
    );
  }
}
