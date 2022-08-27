import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/db/models/task_create_model.dart';

class TaskDbController extends GetxController {
  List<CreateTaskModel> taskDbList = [];
  List<CreateTaskModel> sortedCategoryTasks = [];
  DateTime todayDate = DateTime.now();
  String todayMonth = DateFormat.MMM().format(DateTime.now());
  DateTime pickedMonth = DateTime.now();
  String chosen = '';
  int taskNo = 0;
  String pickedYear = '';
  updatePickedMonth() {
    chosen = '';
    todayMonth = DateFormat.MMM().format(DateTime.now());
    pickedYear = todayDate.year.toString();
    pickedMonth = DateTime.now();
    update();
  }

  updateTaskNo(int value) {
    taskNo = value;
    update();
  }

  updateDate() {
    chosen = 'notnull';
    todayMonth = DateFormat.MMM().format(pickedMonth);
    pickedYear = pickedMonth.year.toString();
    update();
  }

  addToList(CreateTaskModel value) {
    taskDbList.add(value);
    update();
  }

  showTaskList(String nameCategory, String dateCategory) {
    sortedCategoryTasks = taskDbList.where((element) {
      final categoryLower = element.category.toLowerCase();
      final category = nameCategory.toLowerCase();
      final date = dateCategory.toLowerCase();
      final dateSaved = element.dueDate.substring(0, 7);
      return categoryLower.contains(category) && dateSaved.contains(date);
    }).toList();
    update();
  }

  addAllToList(Iterable<CreateTaskModel> values) {
    taskDbList.addAll(values);
    update();
  }

  initState(String category, String date) {
    showTaskList(category, date);
    update();
  }

  clearAll() {
    taskDbList.clear();
    sortedCategoryTasks.clear();
    update();
  }
}
