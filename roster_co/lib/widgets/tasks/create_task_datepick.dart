import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/controllers/task_picker_controller.dart';
import 'package:roster_co/widgets/home/custom_card_widget.dart';

class TaskDatePicker extends StatefulWidget {
  const TaskDatePicker({Key? key}) : super(key: key);

  @override
  State<TaskDatePicker> createState() => _TaskDatePickerState();
}

class _TaskDatePickerState extends State<TaskDatePicker> {
  final TaskPickerController _datePickerController =
      Get.put(TaskPickerController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 64,
      child: TextButton(
          onPressed: () {
            datePicker();
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(0),
          ),
          child: PickerWidgetCard(
            icon: FontAwesomeIcons.calendar,
            subTitle: 'Due Date',
            title: GetBuilder<TaskPickerController>(builder: ((_) {
              return Text(
                "${_datePickerController.todayDate} ${_datePickerController.todayMonth} '${_datePickerController.yrShort}",
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    color: Colors.black,
                    fontSize: 15),
              );
            })),
            iconSize: 19,
          )),
    );
  }

  Future datePicker() async {
    _datePickerController.pickedDate = (await showDatePicker(
            context: context,
            initialDate: _datePickerController.todayDay,
            firstDate: _datePickerController.todayDay,
            lastDate: DateTime(2100),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        _datePickerController.todayDay;

    if (_datePickerController.pickedDate.toString().isEmpty) {
      _datePickerController.pickedDate = _datePickerController.todayDay;
    }
    _datePickerController.updateDate();
  }
}
