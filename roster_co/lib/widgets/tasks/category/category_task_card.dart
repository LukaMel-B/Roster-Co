import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/constants/color_consts.dart';
import 'package:roster_co/constants/icon_constants.dart';
import 'package:roster_co/screens/tasks/%20task_details_page.dart';

// ignore: must_be_immutable
class CategoryTaskCard extends GetView {
  final int index;
  CategoryTaskCard({Key? key, required this.index}) : super(key: key);
  TaskCategoryTitle title = TaskCategoryTitle();
  ColorList colors = ColorList();
  CategoryPageIconLists priorityIconList = CategoryPageIconLists();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(
          10,
        ),
      ),
      onPressed: () {
        Get.to(
          () => TaskDetailsScreen(
            title: title.categoryTitleList[index],
          ),
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
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [priorityIconList.priorityIconList[index]]),
            Text(
              title.categoryTitleList[index],
              style: const TextStyle(
                  fontSize: 21, fontFamily: 'Metropolis', color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        '3 done',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          color: colors.iconColor[index],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        '1 left',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Metropolis',
                          color: colors.iconColor[index],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '23-12-22',
                    style: TextStyle(color: colors.iconColor[index]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
