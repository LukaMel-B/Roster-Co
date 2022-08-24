import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/color_consts.dart';
import 'package:roster_co/controllers/category_db_controller.dart';
import 'package:roster_co/screens/tasks/category_details.dart';

// ignore: must_be_immutable
class TaskCategoryCard extends StatefulWidget {
  final int index;
  const TaskCategoryCard({Key? key, required this.index}) : super(key: key);

  @override
  State<TaskCategoryCard> createState() => _TaskCategoryCardState();
}

class _TaskCategoryCardState extends State<TaskCategoryCard> {
  final CategoryDbController _categorList = CategoryDbController();

  ColorList colors = ColorList();
  late Color iconColor;
  late Color bgColor;

  @override
  void initState() {
    _categorList.updateIndex();
    bgColor = colors.bgColor[_categorList.index];
    iconColor = colors.iconColor[_categorList.index];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(
          () => CategoryDetailsScreen(
            category: _categorList.categoryDb[widget.index].title,
          ),
          transition: Transition.cupertino,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              _categorList.categoryDb[widget.index].icon,
              color: iconColor,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _categorList.categoryDb[widget.index].title,
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
                    '${_categorList.taskNumber} Tasks',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      color: iconColor,
                    ),
                  ),
                ),
                FaIcon(
                  FontAwesomeIcons.arrowRightLong,
                  color: iconColor,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
