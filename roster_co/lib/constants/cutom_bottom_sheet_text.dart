import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheetText extends GetView {
  final String text;
  const CustomBottomSheetText({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Metropolis', color: Colors.black, fontSize: 19),
    );
  }
}
