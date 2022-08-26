import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/controllers/add_subtask_controller.dart';
import 'package:roster_co/widgets/home/custom_card_widget.dart';

class PriorityPickerWidget extends StatefulWidget {
  const PriorityPickerWidget({Key? key}) : super(key: key);

  @override
  State<PriorityPickerWidget> createState() => _PriorityPickerWidgetState();
}

class _PriorityPickerWidgetState extends State<PriorityPickerWidget> {
  final AddTaskController _priorityController = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 65,
      child: PickerWidgetCard(
        icon: _priorityController.iconPriority,
        subTitle: 'Priority',
        title: Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _priorityController.priorityValue,
              icon: const SizedBox(height: 0),
              onChanged: (String? newValue) {
                setState(() {
                  _priorityController.updatePriortiy(newValue!);
                });
              },
              items: _priorityController.itemsPriority.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
            ),
          ),
        ),
        iconSize: 23,
      ),
    );
  }
}
