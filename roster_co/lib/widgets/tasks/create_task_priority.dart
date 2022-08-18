import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roster_co/widgets/home/custom_card_widget.dart';

class PriorityPickerWidget extends StatefulWidget {
  const PriorityPickerWidget({Key? key}) : super(key: key);

  @override
  State<PriorityPickerWidget> createState() => _PriorityPickerWidgetState();
}

class _PriorityPickerWidgetState extends State<PriorityPickerWidget> {
  String dropdownvalue = 'Medium';
  var items = [
    'High',
    'Medium',
    'Low',
  ];
  IconData iconPriority = Icons.priority_high_rounded;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 65,
      child: PickerWidgetCard(
        icon: iconPriority,
        subTitle: 'Priority',
        title: Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: dropdownvalue,
              icon: const SizedBox(height: 0),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                  switch (newValue) {
                    case 'High':
                      iconPriority = CupertinoIcons.flame;
                      break;
                    case 'Medium':
                      iconPriority = Icons.thumb_up_off_alt_outlined;
                      break;
                    case 'Low':
                      iconPriority = FontAwesomeIcons.temperatureEmpty;
                      break;
                    default:
                  }
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
        iconSize: 23,
      ),
    );
  }
}
