import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingButton extends StatefulWidget {
  final Widget page;
  final Widget icon;
  final double radius;
  const CustomFloatingButton(
      {Key? key, required this.page, required this.icon, required this.radius})
      : super(key: key);

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(
          () => widget.page,
          transition: Transition.cupertino,
        );
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.radius)),
      elevation: 25,
      backgroundColor: Colors.black,
      child: widget.icon,
    );
  }
}
