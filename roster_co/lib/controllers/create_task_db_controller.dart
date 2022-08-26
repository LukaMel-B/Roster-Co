import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:roster_co/db/models/task_create_model.dart';

class TaskDbController extends GetxController {
  List<CreateTaskModel> taskDbList = [];
  List<CreateTaskModel> sortedCategoryTasks = [];
  DateTime todayDate = DateTime.now();
  String todayMonth = DateFormat.MMM().format(DateTime.now());
  DateTime? pickedDate;
  String chosen = '';
  late String pickedMonth;
  late String pickedYear;

  updateDate() {
    chosen = 'notnull';
    todayMonth = DateFormat.MMM().format(pickedDate!);
    pickedYear = pickedDate!.year.toString();
    update();
  }

  addToList(CreateTaskModel value) {
    taskDbList.add(value);
    update();
  }

  showTaskList(String nameCategory) {
    sortedCategoryTasks = taskDbList.where((element) {
      final categoryLower = element.category.toLowerCase();
      final category = nameCategory.toLowerCase();
      return categoryLower.contains(category);
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

  initState(String category) {
    showTaskList(category);
    update();
  }
}
