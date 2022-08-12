import 'package:flutter/material.dart';

class MainAppbarWidget extends AppBar {
  MainAppbarWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
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
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontFamily: 'Metropolis'),
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
  }
}
