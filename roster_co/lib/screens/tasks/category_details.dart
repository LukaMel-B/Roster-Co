import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/screens/tasks/create_task_page.dart';
import 'package:roster_co/widgets/tasks/category/category_appbar.dart';
import 'package:roster_co/widgets/tasks/category/category_detail_main_card.dart';

// ignore: must_be_immutable
class CategoryDetailsScreen extends GetView {
  final String category;

  CategoryDetailsScreen({required this.category, Key? key}) : super(key: key);
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
              const CategoryAppBar(),
              CategoryDrawableCard(category: category),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            () => CreateTaskPage(
              category: category,
            ),
            transition: Transition.cupertino,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 25,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add_rounded,
          size: 40,
        ),
      ),
    );
  }
}
