import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/controllers/add_subtask_controller.dart';

final AddTaskController _subTaskController = Get.put(AddTaskController());
late String validatorAlertText;
final textfieldDeco = InputDecoration(
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xffCBCBCB), width: .8),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xffCBCBCB), width: .8),
    ),
    contentPadding: const EdgeInsets.all(19),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xffCBCBCB), width: .8),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: Color(0xffCBCBCB), width: .8),
    ),
    hintText: 'Enter here...',
    hintStyle: const TextStyle(
      fontFamily: 'Metropolis',
      color: Color(0xffADADAD),
    ));
var downIcon = const Icon(
  Icons.keyboard_arrow_down_rounded,
  color: Colors.black,
  size: 24,
);
var sixh_1 = const SizedBox(
  height: 10,
);
var sixw_8 = const SizedBox(
  width: 80,
);
var sixh_2 = const SizedBox(
  height: 20,
);
var sixh_3 = const SizedBox(
  height: 30,
);
var sixh_6 = const SizedBox(
  height: 60,
);

var sixw_1 = const SizedBox(
  height: 10,
);
var sixw_2 = const SizedBox(
  height: 20,
);
var sixw_3 = const SizedBox(
  height: 30,
);
var sixw_6 = const SizedBox(
  height: 60,
);
var txStyle = const TextStyle(fontFamily: 'Metropolis', fontSize: 14);

class Validator {
  final String text;

  Validator({required this.text}) {
    ((value) {
      if (value == null) {
        return text;
      } else {
        return null;
      }
    });
  }
}

String? Function(String?) validator = ((value) {
  if (value!.isEmpty) {
    return "This field is required!";
  } else {
    return null;
  }
});

var subTaskTitle = const Text(
  'Create task',
  style: TextStyle(fontFamily: 'Metropolis', color: Colors.black, fontSize: 19),
);
var subTaskIcon = const Icon(
  Icons.close,
  color: Colors.black,
  size: 33,
);
var appBarTask = AppBar(
  centerTitle: true,
  elevation: 0,
  backgroundColor: Colors.white,
  automaticallyImplyLeading: false,
  title: subTaskTitle,
  actions: [
    TextButton(
        onPressed: () {
          _subTaskController.resetCount();
          Get.back();
        },
        child: subTaskIcon)
  ],
);

class PickerTheme extends GetView {
  final Widget child;
  const PickerTheme(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            dialogTheme: const DialogTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)))),
            fontFamily: 'Metropolis',
            primaryColor: const Color.fromARGB(255, 0, 0, 0),
            colorScheme:
                const ColorScheme.light(primary: Color.fromARGB(255, 0, 0, 0)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
        child: child);
  }
}

var homeAppbar = AppBar(
  elevation: 0,
  backgroundColor: Colors.white,
  leading: Container(
    padding: const EdgeInsets.all(8),
    height: 45,
    width: 40,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset('assets/images/profile_pic.jpeg'),
    ),
  ),
  title: const Text(
    'Hi, Luha!',
    style:
        TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'Metropolis'),
  ),
  actions: [
    IconButton(
      onPressed: () {},
      icon: const Image(
        image: AssetImage(
          'assets/icons/menu_icon.png',
        ),
      ),
    ),
    const SizedBox(
      width: 10,
    ),
  ],
);
