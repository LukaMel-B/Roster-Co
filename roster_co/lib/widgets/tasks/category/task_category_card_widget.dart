import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/constants/color_consts.dart';
import 'package:roster_co/constants/icon_constants.dart';
import 'package:roster_co/screens/tasks/category_details.dart';

// ignore: must_be_immutable
class TaskCategoryCard extends StatelessWidget {
  final int index;
  TaskCategoryCard({Key? key, required this.index}) : super(key: key);
  TaskCategoryTitle title = TaskCategoryTitle();
  ColorList colors = ColorList();
  IconLists taskIcons = IconLists();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(
          () => CategoryDetailsScreen(),
          transition: Transition.cupertino,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: colors.bgColor[index],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            taskIcons.taskIconList[index],
            const SizedBox(
              height: 15,
            ),
            Text(
              title.categoryTitleList[index],
              style: const TextStyle(
                  fontSize: 21, fontFamily: 'Metropolis', color: Colors.black),
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
                    '3 Tasks',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      color: colors.iconColor[index],
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.arrowRightLong,
                  color: colors.iconColor[index],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
