import 'package:get/get.dart';
import 'package:roster_co/db/models/task_create_model.dart';

class TaskDbController extends GetxController {
  List<CreateTaskModel> taskDbList = [];
  List<CreateTaskModel> sortedCategoryTasks = [];
  addToList(CreateTaskModel value) {
    taskDbList.add(value);
    update();
  }

  showTaskList(String nameCategory, String searchMonth) {
    sortedCategoryTasks = taskDbList.where((element) {
      final categoryLower = element.category.toLowerCase();
      final dateMonth = element.date.toLowerCase();
      final category = nameCategory.toLowerCase();
      final month = searchMonth.toLowerCase();
      return categoryLower.contains(category) && dateMonth.contains(month);
    }).toList();
    update();
  }

  getTaskNo() {
    final taskno = sortedCategoryTasks.length;
    return taskno.toString();
  }

  addAllToList(Iterable<CreateTaskModel> values) {
    taskDbList.addAll(values);
    update();
  }
}
