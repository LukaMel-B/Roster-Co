import 'package:flutter/material.dart';

class CreatePageTitle extends StatelessWidget {
  final String title;
  const CreatePageTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontFamily: 'Metropolis', color: Colors.black, fontSize: 15),
    );
  }
}
