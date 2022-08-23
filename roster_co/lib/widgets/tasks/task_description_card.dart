import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';

class TaskDescriptionCard extends GetView {
  const TaskDescriptionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: boxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(fontSize: 18),
            ),
            sixh_1,
            Text(
              'This is where the desrpition about the task will be present.',
              style:
                  GoogleFonts.inter(textStyle: const TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
