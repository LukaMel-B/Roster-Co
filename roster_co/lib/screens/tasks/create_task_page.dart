// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/title_const_class.dart';
import 'package:roster_co/screens/tasks/category_details.dart';
import 'package:roster_co/widgets/tasks/create_task_datepick.dart';
import 'package:roster_co/widgets/tasks/create_task_priority.dart';
import 'package:roster_co/widgets/tasks/create_task_snooze_picker.dart';
import 'package:roster_co/widgets/tasks/create_task_time_picker.dart';
import 'package:roster_co/widgets/home/floating_button.dart';
import 'package:roster_co/widgets/tasks/subtask_add_widget.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const CreatePageTitle(title: 'Task Title'),
                    six1,
                    TextFormField(
                      style: txStyle,
                      validator: validator,
                      controller: titleController,
                      decoration: textfieldDeco,
                    ),
                    six2,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TaskDatePicker(),
                        PriorityPickerWidget(),
                      ],
                    ),
                    six2,
                    six1,
                    const CreatePageTitle(title: 'Description'),
                    six1,
                    TextFormField(
                      style: txStyle,
                      validator: validator,
                      controller: descController,
                      decoration: textfieldDeco,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                    ),
                    six2,
                    six1,
                    const CreatePageTitle(title: 'Time'),
                    six1,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        TaskTimePicker(),
                        SnoozePickerWidget(),
                      ],
                    ),
                    six2,
                    const AddedSubTasks(),
                    six3,
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

  AppBar _buildAppBar() {
    return appBar;
  }
}
