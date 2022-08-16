import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickerWidgetCard extends StatelessWidget {
  final String date;
  final String month;
  final String year;
  const PickerWidgetCard(
      {Key? key, required this.date, required this.month, required this.year})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffCBCBCB),
          width: .8,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            FontAwesomeIcons.calendar,
            color: Colors.black,
            size: 19,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Due Date',
                style: TextStyle(
                    fontFamily: 'Metropolis',
                    color: Color(0xffADADAD),
                    fontSize: 14),
              ),
              Text(
                '$date $month $year',
                style: const TextStyle(
                    fontFamily: 'Metropolis',
                    color: Colors.black,
                    fontSize: 15),
              ),
            ],
          )
        ],
      ),
    );
  }
}
