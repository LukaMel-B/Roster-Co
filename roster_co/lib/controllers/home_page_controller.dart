import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageController extends GetxController {
  var todayMonth = DateFormat.MMM().format(DateTime.now());
  var todayDate = DateFormat.d().format(DateTime.now());
  var todayYear = DateFormat.y().format(DateTime.now());
  final todayDay = DateTime.now();
  var result = DateFormat.y().format(DateTime.now()).substring(2, 4);
  String choosen = '';
  late DateTime pickedDate;

  updateDate() {
    choosen = 'notnull';
    todayDate = DateFormat.d().format(pickedDate);
    todayMonth = DateFormat.MMM().format(pickedDate);
    todayYear = DateFormat.y().format(pickedDate);
    result = todayYear.substring(2, 4);
    update();
  }
}
