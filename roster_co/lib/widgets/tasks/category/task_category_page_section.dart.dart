import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/controllers/category_db_controller.dart';
import 'package:roster_co/screens/tasks/category_details.dart';

// ignore: must_be_immutable

class TaskCategoryWidget extends StatelessWidget {
  TaskCategoryWidget({Key? key}) : super(key: key);
  final CategoryDbController _categorController =
      Get.put(CategoryDbController());
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: GetBuilder<CategoryDbController>(
            //  init: CategoryDbController(),
            builder: ((_) {
          return (_categorController.categoryDb.isEmpty)
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty_category.png',
                      height: 140,
                    ),
                    sixh_1,
                    const Text(
                      'No task categories',
                      style: TextStyle(fontSize: 20),
                    ),
                    sixh_1,
                    const Text(
                      'Feel free to add,\nPress the button below',
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ))
              : GridView.builder(
                  physics: sPhysics,
                  itemCount: _categorController.categoryDb.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {
                        Get.to(
                          () => CategoryDetailsScreen(
                            category:
                                _categorController.categoryDb[index].title,
                          ),
                          transition: Transition.cupertino,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color(
                              _categorController.categoryDb[index].bgColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              IconData(
                                _categorController.categoryDb[index].icon,
                                fontPackage: 'font_awesome_flutter',
                                fontFamily: 'FontAwesomeSolid',
                              ),
                              color: Color(_categorController
                                  .categoryDb[index].iconColor),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              _categorController.categoryDb[index].title,
                              style: const TextStyle(
                                  fontSize: 21,
                                  fontFamily: 'Metropolis',
                                  color: Colors.black),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    '${_categorController.taskNumber} Tasks',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Metropolis',
                                      color: Color(_categorController
                                          .categoryDb[index].iconColor),
                                    ),
                                  ),
                                ),
                                FaIcon(
                                  FontAwesomeIcons.arrowRightLong,
                                  color: Color(_categorController
                                      .categoryDb[index].iconColor),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
        })));
  }
}
