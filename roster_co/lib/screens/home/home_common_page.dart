import 'package:flutter/material.dart';
import 'package:roster_co/widgets/task_category_widget.dart.dart';
import 'package:roster_co/widgets/quotes_card.dart';

class HomeCommonPage extends StatelessWidget {
  final Widget mainPageOption;
  const HomeCommonPage({Key? key, required this.mainPageOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const QuotesCard(),
              mainPageOption,
            ],
          ),
        ),
      ],
    );
  }
}
