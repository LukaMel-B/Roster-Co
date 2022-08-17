import 'package:flutter/material.dart';
import 'package:get/get.dart';

late String validatorAlertText;
final textfieldDeco = InputDecoration(
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
var six1 = const SizedBox(
  height: 10,
);
var six2 = const SizedBox(
  height: 20,
);
var six3 = const SizedBox(
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

var appBar = AppBar(
  centerTitle: true,
  elevation: 0,
  backgroundColor: Colors.white,
  automaticallyImplyLeading: false,
  title: const Text(
    'Create task',
    style:
        TextStyle(fontFamily: 'Metropolis', color: Colors.black, fontSize: 19),
  ),
  actions: [
    TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Icon(
          Icons.close,
          color: Colors.black,
          size: 33,
        ))
  ],
);

GlobalKey<FormState> formKey = GlobalKey();
final titleController = TextEditingController();
final descController = TextEditingController();

class PickerTheme extends StatelessWidget {
  final Widget child;
  const PickerTheme(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            fontFamily: 'Metropolis',
            primaryColor: const Color.fromARGB(255, 0, 0, 0),
            colorScheme:
                const ColorScheme.light(primary: Color.fromARGB(255, 0, 0, 0)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary)),
        child: child);
  }
}
