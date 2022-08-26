import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/controllers/task_picker_controller.dart';
import 'package:roster_co/widgets/home/custom_card_widget.dart';

class TaskTimePicker extends StatefulWidget {
  const TaskTimePicker({Key? key}) : super(key: key);

  @override
  State<TaskTimePicker> createState() => _TaskTimePickerState();
}

class _TaskTimePickerState extends State<TaskTimePicker> {
  final TaskPickerController _timePicker = Get.put(TaskPickerController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 64,
      child: TextButton(
          onPressed: () {
            timePicker();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          child: PickerWidgetCard(
            icon: Icons.alarm,
            subTitle: 'Due Time',
            title: Text(
              _timePicker.selectedTime,
              style: const TextStyle(
                  fontFamily: 'Metropolis', color: Colors.black, fontSize: 15),
            ),
            iconSize: 30,
          )),
    );
  }

  Future timePicker() async {
    _timePicker.pickedTime = (await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        TimeOfDay.now();
    setState(() {
      _timePicker.updateTime(context);
    });
  }
}
