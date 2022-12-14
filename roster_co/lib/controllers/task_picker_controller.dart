import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskPickerController extends GetxController {
  var todayMonth = DateFormat.MMM().format(DateTime.now());
  var todayDate = DateFormat.d().format(DateTime.now());
  var todayYear = DateFormat.y().format(DateTime.now());
  final todayDay = DateTime.now();
  var yrShort = DateFormat.y().format(DateTime.now()).substring(2, 4);
  String choosen = '';
  DateTime pickedDate = DateTime.now();
  String selectedTime = DateFormat.jm().format(DateTime.now()).toString();
  String chosen = '';
  late TimeOfDay? pickedTime;

  updateDate() {
    choosen = 'notnull';
    todayDate = DateFormat.d().format(pickedDate);
    todayMonth = DateFormat.MMM().format(pickedDate);
    todayYear = DateFormat.y().format(pickedDate);
    yrShort = todayYear.substring(2, 4);

    update();
  }

  updateTime(BuildContext context) {
    chosen = 'fgsd';
    selectedTime = pickedTime!.format(context);
  }
}
