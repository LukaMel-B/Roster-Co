import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/widgets/tasks/task_details_showcard.dart';

class ActivitySectionWidget extends GetView {
  const ActivitySectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          TaskShowDetailsCard(
            color: Color.fromARGB(255, 218, 255, 255),
            subTitle: '19 Aug 2022',
            title: 'Due Date',
            icon: FontAwesomeIcons.calendarCheck,
          ),
          TaskShowDetailsCard(
            color: Color(0xffE9DEFF),
            subTitle: '2',
            title: 'Pending tasks',
            icon: Icons.pending_actions_rounded,
          ),
        ],
      ),
    );
  }
}
