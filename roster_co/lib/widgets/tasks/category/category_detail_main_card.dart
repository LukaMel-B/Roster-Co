import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/controllers/create_task_db_controller.dart';
import 'package:roster_co/widgets/tasks/category/category_task_card.dart';

// ignore: must_be_immutable
class CategoryDrawableCard extends StatefulWidget {
  final String category;
  const CategoryDrawableCard({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDrawableCard> createState() => _CategoryDrawableCardState();
}

class _CategoryDrawableCardState extends State<CategoryDrawableCard> {
  final TaskDbController _taskDb = Get.put(TaskDbController());
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: GetBuilder<TaskDbController>(
            init: TaskDbController(),
            builder: ((_) {
              final sortDate = _taskDb.pickedMonth.toString().substring(0, 7);
              _taskDb.initState(widget.category, sortDate);
              // print(todayDate);
              return Column(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                (_taskDb.chosen.isEmpty)
                                    ? ' ${_taskDb.todayMonth} ${_taskDb.todayDate.year}'
                                    : ' ${_taskDb.todayMonth} ${_taskDb.pickedYear}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Metropolis',
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            height: (MediaQuery.of(context).size.height) - 90,
                            child: (_taskDb.sortedCategoryTasks.isEmpty)
                                ? Container(
                                    padding: EdgeInsets.only(
                                        top:
                                            MediaQuery.of(context).size.height -
                                                620),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/empty3.png',
                                          height: 150,
                                        ),
                                        sixh_1,
                                        const Text(
                                          'No tasks yet!',
                                          style: TextStyle(fontSize: 22),
                                        ),
                                        sixh_1,
                                        const Text(
                                          'Feel free to add one,\npress the button below',
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ))
                                : ListView.builder(
                                    physics: sPhysics,
                                    itemBuilder: (BuildContext context, index) {
                                      return CategoryTaskCard(
                                        index: index,
                                      );
                                    },
                                    itemCount:
                                        _taskDb.sortedCategoryTasks.length,
                                  ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            })));
  }

  Future datePicker() async {
    // await getAllTasks();
    _taskDb.pickedMonth = (await showMonthPicker(
          context: context,
          firstDate: DateTime(DateTime.now().year, 5),
          lastDate: DateTime(DateTime.now().year + 50, 9),
          initialDate: _taskDb.todayDate,
        )) ??
        _taskDb.todayDate;
    _taskDb.updateDate();
    final date = _taskDb.pickedMonth.toString().substring(0, 7);
    print(date);
    _taskDb.showTaskList(widget.category, date);
    // _taskDb.pickedDate = (await showDatePicker(
    //       context: context,
    //       initialDate: _taskDb.todayDate,
    //       firstDate: _taskDb.todayDate,
    //       lastDate: DateTime(2100),
    //       builder: (context, child) {
    //         return PickerTheme(child!);
    //       },
    //     )) ??
    //     _taskDb.todayDate;
    // _taskDb.updateDate();
  }
}
