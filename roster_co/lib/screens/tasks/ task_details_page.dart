// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/controllers/create_task_db_controller.dart';
import 'package:roster_co/widgets/tasks/activity_list_showcard.dart';
import 'package:roster_co/widgets/tasks/task_description_card.dart';
import 'package:roster_co/widgets/tasks/task_details_showcard.dart';

class TaskDetailsScreen extends StatefulWidget {
  final int index;
  const TaskDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final TaskDbController _taskController = Get.put(TaskDbController());
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _delay();
      buildMethod();
    });
  }

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
                      _taskController.sortedCategoryTasks[widget.index].title,
                      style: pageTitle,
                    ),
                  ),
                ),
                sixh_2,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: TaskDescriptionCard(_taskController
                      .sortedCategoryTasks[widget.index].description),
                ),
                sixh_1,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TaskShowDetailsCard(
                        color: const Color.fromARGB(255, 218, 255, 255),
                        index: widget.index,
                        title: 'Due Date',
                        icon: FontAwesomeIcons.calendarCheck,
                      ),
                      TaskShowDetailsCard(
                        color: const Color(0xffE9DEFF),
                        index: widget.index,
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
                buildMethod(),
              ],
            ),
          ),
        ));
  }

  buildMethod() {
    return GetBuilder<TaskDbController>(
      init: TaskDbController(),
      builder: ((_) {
        return Flexible(
            child: ListView.builder(
          itemBuilder: (BuildContext context, no) {
            return ActivityListCard(
              icon: (_taskController.sortedCategoryTasks[widget.index]
                          .subTasks[no].isDone ==
                      false)
                  ? Icons.bookmark
                  : Icons.bookmark_added_rounded,
              title: _taskController
                  .sortedCategoryTasks[widget.index].subTasks[no].subTask,
            );
          },
          itemCount:
              _taskController.sortedCategoryTasks[widget.index].subTasks.length,
        )
            // ListView(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   children: const [
            //     ActivityListCard(
            //       icon: Icons.bookmark_added_rounded,
            //       title:
            //           'hjghghghfvhghbhjbjhjhbjjhhjkjkbghgjhbzxbcjsdhfjshfjsafhjdsahfsadjfa',
            //     ),
            //     ActivityListCard(
            //       icon: Icons.bookmark,
            //       title: 'Activity 2',
            //     ),
            //     ActivityListCard(
            //       icon: Icons.bookmark,
            //       title: 'Activity 3',
            //     ),
            //   ],
            // ),
            );
      }),
    );
  }

  _delay() async {
    await Future.delayed(const Duration(minutes: 3));
  }
}
