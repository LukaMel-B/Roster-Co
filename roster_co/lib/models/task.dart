import 'package:flutter/material.dart';

class TaskModel {
  final IconData icon;
  final String title;
  final Color bgColor;
  final Color iconColor;
  final String taskNo;

  TaskModel(
      {required this.icon,
      required this.taskNo,
      required this.title,
      required this.bgColor,
      required this.iconColor});
}
