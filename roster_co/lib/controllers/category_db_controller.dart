import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:roster_co/controllers/color_const_controller.dart';
import 'package:roster_co/controllers/add_subtask_controller.dart';
import 'package:roster_co/db/models/task_category_model.dart';

AddTaskController subTask = Get.put(AddTaskController());
ColorListController colorList = Get.put(ColorListController());

class CategoryDbController extends GetxController {
  final box = GetStorage();
  List<TaskCategoryModel> categoryDb = [];
  IconData? selectedIcon;
  List<Color> bgColorDb = [];
  List<Color> iconColorDb = [];
  int bgColorIndex = -1;
  int iconColorIndex = -1;

  List bgColorList = const [
    0xffFEF7E9,
    0xffFFF1F0,
    0xffECF5FF,
    0xffF1EBFF,
    0xffFFF0FC,
    0xffF1FFF1,
    0xffEAFFFF,
    0xffFFF5EE,
    0xffF5F5F5,
    0xffF0F0FF,
  ];
  List iconColorList = const [
    0xffFFC685,
    0xffFE8184,
    0xff6DAEEA,
    0xffA483F0,
    0xffEB84D6,
    0xff62D162,
    0xff47D0D0,
    0xffE6A373,
    0xff706D6D,
    0xff7676E8,
  ];

  resetIcon() {
    selectedIcon = null;
    update();
  }

  updateIcon(IconData result) {
    selectedIcon = result;
    subTask.iconPriority = Icons.priority_high_rounded;
    update();
  }

  addToList(TaskCategoryModel value) {
    categoryDb.add(value);
    update();
  }

  updateIndex() {
    if (iconColorIndex < 9) {
      iconColorIndex++;
      bgColorIndex++;
    } else {
      bgColorIndex = 0;
      iconColorIndex = 0;
    }
    box.write('iconIndex', iconColorIndex);
    box.write('bgIndex', bgColorIndex);
    update();
  }

  addAllToList(Iterable<TaskCategoryModel> values) {
    categoryDb.addAll(values);
    update();
  }

  cleanBox() {
    box.remove('iconIndex');
    box.remove('bgIndex');
  }

  initalIndex() {
    colorList.updateColor();
    double idsb = subTask.boxSubtask.read('isSubTask') ??
        1000000000000099949986540584949514240;
    int iconIndex = box.read('iconIndex') ?? -1;
    int bgIndex = box.read('bgIndex') ?? -1;
    subTask.idsubTask = idsb;
    iconColorIndex = iconIndex;
    bgColorIndex = bgIndex;
    update();
  }
}
//  Color.fromARGB(255, 229, 255, 229),