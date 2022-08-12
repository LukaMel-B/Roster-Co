import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/widgets/task_category_card_widget.dart';

// ignore: must_be_immutable
class CategoryDrawableCard extends StatefulWidget {
  const CategoryDrawableCard({Key? key}) : super(key: key);

  @override
  State<CategoryDrawableCard> createState() => _CategoryDrawableCardState();
}

class _CategoryDrawableCardState extends State<CategoryDrawableCard> {
  DateTime todayDate = DateTime.now();
  String todayMonth = DateFormat.MMM().format(DateTime.now());
  DateTime? pickedDate;
  String choosen = '';
  late String pickedMonth;
  late String pickedYear;
  late String pickedDay;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 83,
                    child: TextButton(
                      onPressed: () {
                        datePicker();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Date',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                                fontFamily: 'Metropolis',
                                letterSpacing: .5),
                          ),
                          Icon(
                            FontAwesomeIcons.angleDown,
                            size: 13,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    (choosen.isEmpty)
                        ? '${todayDate.year} $todayMonth ${todayDate.day}'
                        : '$pickedYear $todayMonth $pickedDay',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Metropolis',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    return TaskCategoryCard(
                      index: index,
                    );
                  },
                  itemCount: 9,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future datePicker() async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: todayDate,
        firstDate: todayDate,
        lastDate: DateTime(2100));
    setState(() {
      choosen = 'notnull';
      pickedDay = pickedDate!.day.toString();
      todayMonth = DateFormat.MMM().format(pickedDate!);
      pickedYear = pickedDate!.year.toString();
    });
  }
}
