import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/close_button.dart';

class BottomSheetTitle extends GetView {
  final String title;
  const BottomSheetTitle({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          width: 25,
        ),
        const CustomCloseButton(
          size: 35,
        ),
      ],
    );
  }
}
