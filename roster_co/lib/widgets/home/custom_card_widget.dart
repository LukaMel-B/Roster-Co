import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickerWidgetCard extends GetView {
  final IconData icon;
  final double iconSize;
  final String subTitle;
  final Widget title;
  const PickerWidgetCard(
      {Key? key,
      required this.icon,
      required this.subTitle,
      required this.title,
      required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffCBCBCB),
          width: .8,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: iconSize,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    color: Color(0xffADADAD),
                    fontSize: 14),
              ),
              title,
            ],
          )
        ],
      ),
    );
  }
}
