// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/create_task_consts.dart';
import 'package:roster_co/screens/events/events_screen.dart';
import 'package:roster_co/screens/tasks/task_screen.dart';
import 'package:roster_co/widgets/events/create_event_btsheet.dart';
import 'package:roster_co/widgets/home/bottom_nav_widget.dart';
import 'package:roster_co/widgets/home/quotes_card.dart';
import 'package:roster_co/widgets/tasks/category/create_category_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final pages = const [MainTaskScreen(), MainEventScreen()];
  var selectPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          color: Colors.white,
          child: ValueListenableBuilder(
              valueListenable: selectedIndexNotifier,
              builder: (BuildContext context, int clickedIndex, Widget? _) {
                selectPage = pages[clickedIndex].toString();
                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [const QuotesCard(), pages[clickedIndex]],
                      ),
                    ),
                  ],
                );
              }),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            (selectPage == 'MainTaskScreen')
                ? Get.bottomSheet(const CreateTaskCategory(),
                    isScrollControlled: true)
                : Get.bottomSheet(const CreatEventSheet());
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 12,
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add_rounded,
            size: 40,
          ),
        ));
  }

  AppBar _buildAppBar() {
    return homeAppbar;
  }
}
