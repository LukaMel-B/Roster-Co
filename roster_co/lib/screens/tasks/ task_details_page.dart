// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/widgets/tasks/activity_list_showcard.dart';
import 'package:roster_co/widgets/tasks/task_description_card.dart';
import 'package:roster_co/widgets/tasks/task_details_showcard.dart';

class TaskDetailsScreen extends GetView {
  final String title;
  const TaskDetailsScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTaskDetails,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Container(
          color: Colors.white,
          child: ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    title,
                    style: pageTitle,
                  ),
                ),
              ),
              sixh_2,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: TaskDescriptionCard(),
              ),
              sixh_1,
              Padding(
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
              ),
              sixh_3,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Activity List',
                  style: TextStyle(fontSize: 21),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: const ActivityListCard(
                      icon: Icons.bookmark_added_rounded,
                      title:
                          'hjghghghfvhghbhjbjhjhbjjhhjkjkbghgjhbzxbcjsdhfjshfjsafhjdsahfsadjfa',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: const ActivityListCard(
                      icon: Icons.bookmark,
                      title: 'Activity 2',
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: const ActivityListCard(
                        icon: Icons.bookmark,
                        title: 'Activity 3',
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
