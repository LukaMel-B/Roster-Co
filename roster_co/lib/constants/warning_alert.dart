import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showIconAlert(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            'Warning!',
            style: TextStyle(color: Colors.red),
          ),
          content:
              const Text('You did not pick an icon, Please choose an icon.'),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel')),
          ],
        );
      });
}
