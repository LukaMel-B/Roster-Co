import 'package:flutter/material.dart';

class TaskCategoryModel {
  final IconData icon;
  final String title;
  final Color bgColor;
  final Color iconColor;
  final int taskNo;

  TaskCategoryModel(
      {required this.icon,
      required this.taskNo,
      required this.title,
      required this.bgColor,
      required this.iconColor});
}
