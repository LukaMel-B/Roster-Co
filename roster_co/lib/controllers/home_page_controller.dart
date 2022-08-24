import 'package:get/get.dart';
import 'package:roster_co/db/functions/task_db_functions.dart';

class CategoryDetailsController extends GetxController {
  String taskNumber = '0';

  updateTaskNo() {
    taskNumber = taskList.getTaskNo.toString();
    update();
  }
}
