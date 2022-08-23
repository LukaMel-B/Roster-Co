import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/constants/task_details_consts.dart';
import 'package:roster_co/controllers/category_details_page_controller.dart';
import 'package:roster_co/widgets/tasks/category/category_task_card.dart';

// ignore: must_be_immutable
class CategoryDrawableCard extends StatefulWidget {
  const CategoryDrawableCard({Key? key}) : super(key: key);

  @override
  State<CategoryDrawableCard> createState() => _CategoryDrawableCardState();
}

class _CategoryDrawableCardState extends State<CategoryDrawableCard> {
  final CategoryDetailsController _categoryController =
      Get.put(CategoryDetailsController());
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
                      GetBuilder<CategoryDetailsController>(builder: ((_) {
                        return Text(
                          (_categoryController.chosen.isEmpty)
                              ? '${_categoryController.todayDate.year} ${_categoryController.todayMonth} ${_categoryController.todayDate.day}'
                              : '${_categoryController.pickedYear} ${_categoryController.todayMonth} ${_categoryController.pickedDay}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Metropolis',
                          ),
                        );
                      })),
                    ],
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height) - 90,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: sPhysics,
                      itemBuilder: (BuildContext context, index) {
                        return CategoryTaskCard(
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
    _categoryController.pickedDate = (await showDatePicker(
          context: context,
          initialDate: _categoryController.todayDate,
          firstDate: _categoryController.todayDate,
          lastDate: DateTime(2100),
          builder: (context, child) {
            return PickerTheme(child!);
          },
        )) ??
        _categoryController.todayDate;
    _categoryController.updateDate();
  }
}
