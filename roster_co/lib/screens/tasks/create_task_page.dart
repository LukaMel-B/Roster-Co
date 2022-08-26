// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/constants/title_const_class.dart';
import 'package:roster_co/controllers/add_subtask_controller.dart';
import 'package:roster_co/controllers/task_picker_controller.dart';
import 'package:roster_co/db/functions/task_db_functions.dart';
import 'package:roster_co/db/models/task_create_model.dart';
import 'package:roster_co/widgets/tasks/create_task_datepick.dart';
import 'package:roster_co/widgets/tasks/create_task_priority.dart';
import 'package:roster_co/widgets/tasks/create_task_snooze_picker.dart';
import 'package:roster_co/widgets/tasks/create_task_time_picker.dart';
import 'package:roster_co/widgets/tasks/subtask_add_widget.dart';

class CreateTaskPage extends GetView {
  final String category;
  CreateTaskPage({required this.category, Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  final AddTaskController _taskController = Get.put(AddTaskController());
  final TaskPickerController _datePickerController =
      Get.put(TaskPickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarTask,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Form(
                  key: formKey,
                  child: ListView(
                    physics: sPhysics,
                    children: [
                      const CreatePageTitle(title: 'Task Title'),
                      sixh_1,
                      TextFormField(
                        style: txStyle,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Title is required!";
                          } else {
                            return null;
                          }
                        }),
                        controller: titleController,
                        decoration: textfieldDeco,
                      ),
                      sixh_2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TaskDatePicker(),
                          PriorityPickerWidget(),
                        ],
                      ),
                      sixh_3,
                      const CreatePageTitle(title: 'Description'),
                      sixh_1,
                      TextFormField(
                        style: txStyle,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Description is required!";
                          } else {
                            return null;
                          }
                        }),
                        controller: descController,
                        decoration: textfieldDeco,
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                      ),
                      sixh_3,
                      const CreatePageTitle(title: 'Time'),
                      sixh_1,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TaskTimePicker(),
                          SnoozePickerWidget(),
                        ],
                      ),
                      sixh_2,
                      const AddedSubTasks(),
                      sixh_6,
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                _onButtonPress();
              }
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 25,
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.done,
              size: 45,
            )));
  }

  void _onButtonPress() async {
    final subtasks = _taskController.subTaskList;

    final snooze = int.parse(_taskController.snoozeValue.substring(0, 1));
    final dueDate =
        DateFormat("yyyy-MM-dd").format(_datePickerController.pickedDate);

    final newTask = CreateTaskModel(
        title: titleController.text.trim(),
        dueDate: dueDate,
        createDate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        priority: _taskController.priorityValue,
        description: descController.text.trim(),
        time: _datePickerController.selectedTime,
        snooze: snooze,
        subTasks: subtasks,
        category: category);

    log(newTask.subTasks.toString());
    await addTask(newTask);
    _taskController.resetCount();
    Get.back(result: CreateTaskPage(category: category));
    await getAllTasks();
  }
}
