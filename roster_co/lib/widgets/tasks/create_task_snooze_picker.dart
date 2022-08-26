import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/controllers/add_subtask_controller.dart';
import 'package:roster_co/widgets/home/custom_card_widget.dart';

class SnoozePickerWidget extends StatefulWidget {
  const SnoozePickerWidget({Key? key}) : super(key: key);

  @override
  State<SnoozePickerWidget> createState() => _SnoozePickerWidgetState();
}

class _SnoozePickerWidgetState extends State<SnoozePickerWidget> {
  final AddTaskController _snoozeController = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 65,
      child: PickerWidgetCard(
        icon: Icons.update_rounded,
        subTitle: 'Snooze for',
        title: Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: _snoozeController.snoozeValue,
              icon: const SizedBox(height: 0),
              onChanged: (String? newValue) {
                setState(() {
                  _snoozeController.snoozeValue = newValue!;
                });
              },
              items: _snoozeController.itemsSnooze.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
            ),
          ),
        ),
        iconSize: 30,
      ),
    );
  }
}
