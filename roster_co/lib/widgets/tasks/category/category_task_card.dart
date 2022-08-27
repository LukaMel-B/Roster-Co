import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:roster_co/controllers/color_const_controller.dart';
import 'package:roster_co/controllers/create_task_db_controller.dart';
import 'package:roster_co/screens/tasks/%20task_details_page.dart';

// ignore: must_be_immutable
class CategoryTaskCard extends StatefulWidget {
  final int index;
  const CategoryTaskCard({Key? key, required this.index}) : super(key: key);

  @override
  State<CategoryTaskCard> createState() => _CategoryTaskCardState();
}

class _CategoryTaskCardState extends State<CategoryTaskCard> {
  final ColorListController _colorListController =
      Get.put(ColorListController());

  final TaskDbController _taskController = Get.put(TaskDbController());
  @override
  void initState() {
    _colorListController.updatePriortiy(
        _taskController.sortedCategoryTasks[widget.index].priority);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(
          10,
        ),
      ),
      onPressed: () {
        Future.microtask(() => (Get.to(
              () => TaskDetailsScreen(
                index: widget.index,
              ),
              transition: Transition.cupertino,
            )));
        // Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //       barrierDismissible: true,
        //       opaque: false,
        //       pageBuilder: ((context, animation, secondaryAnimation) =>
        //           TaskDetailsScreen(
        //             index: widget.index,
        //           )),
        //     ));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _colorListController.bgColorList[widget.index],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Icon(
                _colorListController.iconPriority,
                color: Colors.black,
              )
            ]),
            Text(
              _taskController.sortedCategoryTasks[widget.index].title,
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
                          color:
                              _colorListController.iconColorList[widget.index],
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
                          color:
                              _colorListController.iconColorList[widget.index],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    _taskController
                        .sortedCategoryTasks[widget.index].createDate,
                    style: TextStyle(
                        color:
                            _colorListController.iconColorList[widget.index]),
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
