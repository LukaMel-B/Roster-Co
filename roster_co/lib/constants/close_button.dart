import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCloseButton extends StatelessWidget {
  final double size;
  const CustomCloseButton({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Get.back();
        },
        child: Icon(
          Icons.close,
          color: Colors.black,
          size: size,
        ));
  }
}
