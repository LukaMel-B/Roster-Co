import 'package:flutter/material.dart';
import 'package:get/get.dart';

var appBarTaskDetails = AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  leading: IconButton(
    onPressed: () {
      Get.back();
    },
    icon: const Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Icon(
        Icons.keyboard_backspace_sharp,
        color: Colors.black,
        size: 36,
      ),
    ),
  ),
  actions: const [
    Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Center(
        child: Text(
          'Task Overview',
          style: TextStyle(
            fontFamily: 'Metropolis',
            color: Color(0xffADADAD),
          ),
        ),
      ),
    ),
  ],
);
var pageTitle = const TextStyle(
  fontSize: 27,
  fontFamily: 'Metropolis Black',
  color: Colors.black,
);

var boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  border: Border.all(
    color: const Color.fromARGB(255, 209, 209, 209),
    width: 1,
  ),
);

var sPhysics = const BouncingScrollPhysics();
