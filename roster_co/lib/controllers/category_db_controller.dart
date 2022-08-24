import 'package:get/get.dart';
import 'package:roster_co/db/models/task_category_model.dart';

class CategoryDbController extends GetxController {
  List<TaskCategoryModel> categoryDb = [];
  addToList(TaskCategoryModel value) {
    categoryDb.add(value);
    update();
  }

  addAllToList(Iterable<TaskCategoryModel> values) {
    categoryDb.addAll(values);
    update();
  }
}
