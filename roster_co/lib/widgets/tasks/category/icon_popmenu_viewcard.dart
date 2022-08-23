import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IconViewCard extends GetView {
  final IconData icon;
  const IconViewCard(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 10, crossAxisSpacing: 10),
          itemBuilder: (BuildContext context, int intex) {
            return Icon(icon);
          }),
    );
  }
}
