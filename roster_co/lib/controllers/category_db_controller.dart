import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/db/models/task_category_model.dart';
import 'package:roster_co/db/functions/task_db_functions.dart';

class CategoryDbController extends GetxController {
  List<TaskCategoryModel> categoryDb = [];
  List<Color> bgColorDb = [];
  List<Color> iconColorDb = [];
  int bgColorIndex = -1;
  int iconColorIndex = -1;
  String taskNumber = '0';
  int index = -1;

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

  addToList(TaskCategoryModel value) {
    categoryDb.add(value);
    update();
  }

  updateIndex() {
    if (index < 9) {
      index++;
      iconColorIndex++;
      bgColorIndex++;
    } else {
      index = 0;
      bgColorIndex = 0;
      iconColorIndex = 0;
    }
    print(index.toString());
    print(bgColorIndex.toString());
    update();
  }

  updateTaskNo() {
    taskNumber = taskList.getTaskNo.toString();
    update();
  }

  addAllToList(Iterable<TaskCategoryModel> values) {
    categoryDb.addAll(values);
    update();
  }

  @override
  void onInit() {
    // updateIndex();

    super.onInit();
  }
}
