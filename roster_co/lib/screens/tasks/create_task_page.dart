// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/constants/title_const_class.dart';
import 'package:roster_co/controllers/add_subtask_controller.dart';
import 'package:roster_co/widgets/tasks/create_task_datepick.dart';
import 'package:roster_co/widgets/tasks/create_task_priority.dart';
import 'package:roster_co/widgets/tasks/create_task_snooze_picker.dart';
import 'package:roster_co/widgets/tasks/create_task_time_picker.dart';
import 'package:roster_co/widgets/tasks/subtask_add_widget.dart';

class CreateTaskPage extends GetView {
  final String category;
  CreateTaskPage({required this.category, Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  final AddSubTaskController _subTaskController =
      Get.put(AddSubTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: subTaskTitle,
          actions: [
            TextButton(
                onPressed: () {
                  _subTaskController.resetCount();
                  Get.back();
                },
                child: subTaskIcon)
          ],
        ),
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
                _subTaskController.resetCount();
                Get.back(result: CreateTaskPage(category: category));
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
}
