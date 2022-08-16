import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/screens/tasks/create_task_page.dart';
import 'package:roster_co/widgets/category_appbar.dart';
import 'package:roster_co/widgets/category_detail_main_card.dart';

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
          child: CustomScrollView(
            slivers: [
              CategoryAppBar(),
              CategoryDrawableCard(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => CreateTaskPage(),
            transition: Transition.cupertino,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 20,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add_rounded,
          size: 36,
        ),
      ),
    );
  }
}
