import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/widgets/custom_card_widget.dart';

class TaskDatePick extends StatefulWidget {
  const TaskDatePick({Key? key}) : super(key: key);

  @override
  State<TaskDatePick> createState() => _TaskDatePickState();
}

class _TaskDatePickState extends State<TaskDatePick> {
  var todayMonth = DateFormat.MMM().format(DateTime.now());
  var todayDate = DateFormat.d().format(DateTime.now());
  var todayYear = DateFormat.y().format(DateTime.now());
  late String result;
  @override
  Widget build(BuildContext context) {
    result = todayYear.substring(2, 4);
    // print(todayYear.length);
    return SizedBox(
      width: 90,
      height: 80,
      child: TextButton(
          onPressed: () {},
          child: PickerWidgetCard(
              date: todayDate, month: todayMonth, year: result)),
    );
  }
}
