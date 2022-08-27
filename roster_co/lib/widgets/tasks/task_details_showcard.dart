import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/controllers/create_task_db_controller.dart';

class TaskShowDetailsCard extends StatefulWidget {
  final String title;
  final int index;
  final Color color;
  final IconData icon;
  const TaskShowDetailsCard(
      {Key? key,
      required this.title,
      required this.index,
      required this.color,
      required this.icon})
      : super(key: key);

  @override
  State<TaskShowDetailsCard> createState() => _TaskShowDetailsCardState();
}

final TaskDbController _taskDbController = Get.put(TaskDbController());
String dueDate = '';
String taskNo = '';

class _TaskShowDetailsCardState extends State<TaskShowDetailsCard> {
  @override
  void initState() {
    dueDate = _taskDbController.sortedCategoryTasks[widget.index].dueDate;
    final DateTime temp = DateTime.parse(dueDate);
    final month = DateFormat.MMM().format(temp);
    final year = DateFormat.y().format(temp);
    final date = DateFormat.d().format(temp);
    dueDate = '$date $month $year';
    taskNo = _taskDbController.sortedCategoryTasks[widget.index].subTasks.length
        .toString();
    _taskDbController.updateTaskNo(
        _taskDbController.sortedCategoryTasks[widget.index].subTasks.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.color,
        // color: const Color.fromARGB(255, 218, 255, 255),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
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
                widget.icon,
                size: (widget.icon == Icons.pending_actions_rounded) ? 22 : 20,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                (widget.title == 'Due Date') ? dueDate : taskNo,
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
