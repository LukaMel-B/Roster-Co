import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:roster_co/constants/title_const_class.dart';

class TitlePadding extends GetView {
  final String title;
  const TitlePadding({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CreatePageTitle(title: title),
    );
  }
}
