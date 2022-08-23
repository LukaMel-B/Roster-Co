// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/constants/title_const_class.dart';
import 'package:roster_co/screens/tasks/category_details.dart';
import 'package:roster_co/widgets/tasks/create_task_datepick.dart';
import 'package:roster_co/widgets/tasks/create_task_priority.dart';
import 'package:roster_co/widgets/tasks/create_task_snooze_picker.dart';
import 'package:roster_co/widgets/tasks/create_task_time_picker.dart';
import 'package:roster_co/widgets/home/floating_button.dart';
import 'package:roster_co/widgets/tasks/subtask_add_widget.dart';

class CreateTaskPage extends GetView {
  const CreateTaskPage({Key? key}) : super(key: key);
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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Form(
                key: formKey,
                child: ListView(
                  physics: sPhysics,
                  children: [
                    const CreatePageTitle(title: 'Task Title'),
                    sixh_1,
                    TextFormField(
                      style: txStyle,
                      validator: validator,
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
                    sixh_2,
                    sixh_1,
                    const CreatePageTitle(title: 'Description'),
                    sixh_1,
                    TextFormField(
                      style: txStyle,
                      validator: validator,
                      controller: descController,
                      decoration: textfieldDeco,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                    ),
                    sixh_2,
                    sixh_1,
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
      floatingActionButton: CustomFloatingButton(
          page: CategoryDetailsScreen(),
          icon: const Icon(
            Icons.done,
            size: 45,
          ),
          radius: 15),
    );
  }
}
