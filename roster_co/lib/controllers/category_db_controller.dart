import 'package:get/get.dart';
import 'package:roster_co/db/models/task_category_model.dart';
import 'package:roster_co/db/functions/task_db_functions.dart';

class CategoryDbController extends GetxController {
  List<TaskCategoryModel> categoryDb = [];
  String taskNumber = '0';
  int index = 0;
  addToList(TaskCategoryModel value) {
    categoryDb.add(value);
    update();
  }

  updateIndex() {
    if (index < 10) {
      ++index;
    } else {
      index = 0;
    }
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
}
