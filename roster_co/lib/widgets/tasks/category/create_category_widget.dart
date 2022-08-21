import 'package:flutter/material.dart';
import 'package:roster_co/constants/close_button.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/title_const_class.dart';

class CreateTaskCategory extends StatefulWidget {
  const CreateTaskCategory({Key? key}) : super(key: key);

  @override
  State<CreateTaskCategory> createState() => _CreateTaskCategoryState();
}

class _CreateTaskCategoryState extends State<CreateTaskCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'Create New Category',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                width: 25,
              ),
              CustomCloseButton(
                size: 35,
              ),
            ],
          ),
          const CreatePageTitle(title: 'Category Title'),
          TextFormField(
            style: txStyle,
            validator: validator,
            controller: titleController,
            decoration: textfieldDeco,
          ),
          TextButton(
              onPressed: () {},
              child: Container(
                child: Row(
                  children: [],
                ),
              ))
        ],
      ),
    );
  }
}
