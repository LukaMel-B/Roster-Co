import 'package:flutter/material.dart';
import 'package:roster_co/widgets/custom_card_widget.dart';

class SnoozePickerWidget extends StatefulWidget {
  const SnoozePickerWidget({Key? key}) : super(key: key);

  @override
  State<SnoozePickerWidget> createState() => _SnoozePickerWidgetState();
}

class _SnoozePickerWidgetState extends State<SnoozePickerWidget> {
  String dropdownvalue = '5 Minutes';
  var items = [
    '5 Minutes',
    '10 Minutes',
    '15 Minutes',
    '30 Minutes',
    '45 Minutes',
    '1 Hour',
  ];
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
              value: dropdownvalue,
              icon: const SizedBox(height: 0),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
              items: items.map((location) {
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
