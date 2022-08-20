// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/widgets/tasks/activity_list_showcard.dart';
import 'package:roster_co/widgets/tasks/task_description_card.dart';
import 'package:roster_co/widgets/tasks/task_details_showcard.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTaskDetails,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: ListView(
              physics: sPhysics,
              children: [
                Center(
                  child: Text(
                    'Vocabulary Development',
                    style: pageTitle,
                  ),
                ),
                sixh_3,
                const TaskDescriptionCard(),
                sixh_1,
                Row(
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
                sixh_3,
                sixh_1,
                const Text(
                  'Activity List',
                  style: TextStyle(fontSize: 21),
                ),
                const ActivityListCard(
                  icon: Icons.bookmark_added_rounded,
                  title: 'Activity 1',
                ),
                const ActivityListCard(
                  icon: Icons.bookmark,
                  title: 'Activity 2',
                ),
                const ActivityListCard(
                  icon: Icons.bookmark,
                  title: 'Activity 3',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
