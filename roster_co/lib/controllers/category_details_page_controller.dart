import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CategoryDetailsController extends GetxController {
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
}
