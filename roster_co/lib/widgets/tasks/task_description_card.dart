import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';

class TaskDescriptionCard extends GetView {
  final String desc;
  const TaskDescriptionCard(this.desc, {Key? key}) : super(key: key);

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
              desc,
              style:
                  GoogleFonts.inter(textStyle: const TextStyle(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
