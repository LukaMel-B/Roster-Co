import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/widgets/tasks/task_details_card.dart';

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
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
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
                  // SliverList(
                  //   delegate: SliverChildBuilderDelegate(((context, index) {
                  //     return SingleChildScrollView(
                  //       child: Column(
                  //         children: [
                  //           Container(
                  //             child: ListView.builder(
                  //                 shrinkWrap: true,
                  //                 physics: NeverScrollableScrollPhysics(),
                  //                 itemBuilder: (BuildContext context, int index) {
                  //                   return TaskCategoryCard(index: index);
                  //                 }),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   }), childCount: 3),
                  // )
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) - 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: sPhysics,
                      itemBuilder: (BuildContext context, index) {
                        return CategoryDetailsCard(
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
        ],
      ),
    );
  }

  Future datePicker() async {
    pickedDate = (await showDatePicker(
          context: context,
          initialDate: todayDate,
          firstDate: todayDate,
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                  fontFamily: 'Metropolis',
                  primaryColor: const Color.fromARGB(255, 0, 0, 0),
                  colorScheme: const ColorScheme.light(
                      primary: Color.fromARGB(255, 0, 0, 0)),
                  buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                  )),
              child: child!,
            );
          },
        )) ??
        todayDate;
    setState(() {
      choosen = 'notnull';
      pickedDay = pickedDate!.day.toString();
      todayMonth = DateFormat.MMM().format(pickedDate!);
      pickedYear = pickedDate!.year.toString();
    });
  }
}
