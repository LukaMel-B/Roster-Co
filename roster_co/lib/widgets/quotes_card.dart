import 'package:flutter/material.dart';

class QuotesCard extends StatelessWidget {
  const QuotesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
      ),
    ); // Container
  }
}
