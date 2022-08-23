import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskShowDetailsCard extends GetView {
  final String title;
  final String subTitle;
  final Color color;
  final IconData icon;
  const TaskShowDetailsCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        // color: const Color.fromARGB(255, 218, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Metropolis',
              fontSize: 16,
              color: Color(0xff676767),
            ),
          ),
          const SizedBox(
            height: 10,
            width: 120,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                size: (icon == Icons.pending_actions_rounded) ? 22 : 20,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                subTitle,
                style: const TextStyle(
                  fontFamily: 'Metropolis',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
