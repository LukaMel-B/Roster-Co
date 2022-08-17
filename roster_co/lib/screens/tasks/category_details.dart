import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/screens/tasks/create_task_page.dart';
import 'package:roster_co/widgets/category_appbar.dart';
import 'package:roster_co/widgets/category_detail_main_card.dart';
import 'package:roster_co/widgets/floating_button.dart';

// ignore: must_be_immutable
class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key}) : super(key: key);
  TaskCategoryTitle titleTask = TaskCategoryTitle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: const CustomScrollView(
            slivers: [
              CategoryAppBar(),
              CategoryDrawableCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingButton(
          page: CreateTaskPage(),
          icon: Icon(
            Icons.add_rounded,
            size: 40,
          ),
          radius: 10),
    );
  }
}
