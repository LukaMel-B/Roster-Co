import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSubTaskController extends GetxController {
  final List<TextEditingController> controllers = [];
  int count = 0;
  addController(TextEditingController controller) {
    controllers.add(controller);
    update();
  }

  updateCount() {
    count++;
    update();
  }

  resetCount() {
    count = 0;
    update();
  }
}
