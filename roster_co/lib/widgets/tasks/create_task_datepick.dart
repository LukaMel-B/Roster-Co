import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/widgets/home/custom_card_widget.dart';

class TaskDatePicker extends StatefulWidget {
  const TaskDatePicker({Key? key}) : super(key: key);

  @override
  State<TaskDatePicker> createState() => _TaskDatePickerState();
}

class _TaskDatePickerState extends State<TaskDatePicker> {
  var todayMonth = DateFormat.MMM().format(DateTime.now());
  var todayDate = DateFormat.d().format(DateTime.now());
  var todayYear = DateFormat.y().format(DateTime.now());
  final todayDay = DateTime.now();
  late String result;
  String choosen = '';
  late DateTime pickedDate;
  @override
  Widget build(BuildContext context) {
    result = todayYear.substring(2, 4);
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
            title: Text(
              '$todayDate $todayMonth $result',
              style: const TextStyle(
                  fontFamily: 'Metropolis', color: Colors.black, fontSize: 15),
            ),
            iconSize: 19,
          )),
    );
  }

  Future datePicker() async {
    pickedDate = (await showDatePicker(
            context: context,
            initialDate: todayDay,
            firstDate: todayDay,
            lastDate: DateTime(2100),
            builder: (context, child) {
              return PickerTheme(child!);
            })) ??
        todayDay;

    if (pickedDate.toString().isEmpty) {
      pickedDate = todayDay;
    }
    setState(() {
      choosen = 'notnull';
      todayDate = DateFormat.d().format(pickedDate);
      todayMonth = DateFormat.MMM().format(pickedDate);
      todayYear = DateFormat.y().format(pickedDate);
    });
  }
}
