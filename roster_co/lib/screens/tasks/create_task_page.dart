// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/textfield_input.dart';
import 'package:roster_co/widgets/create_task_datepick.dart';

class CreateTaskPage extends StatelessWidget {
  CreateTaskPage({Key? key}) : super(key: key);
  GlobalKey<FormState> formKey = GlobalKey();
  final titleController = TextEditingController();
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
                    const Text(
                      'Task Title',
                      style: TextStyle(
                          fontFamily: 'Metropolis',
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontFamily: 'Metropolis', fontSize: 14),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter a title!";
                        } else {
                          return null;
                        }
                      }),
                      controller: titleController,
                      decoration: textfieldDeco,
                    ),
                    TaskDatePick()
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: const Text(
        'Create task',
        style: TextStyle(
            fontFamily: 'Metropolis', color: Colors.black, fontSize: 19),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Icon(
              Icons.close,
              color: Colors.black,
              size: 33,
            ))
      ],
    );
  }
}
