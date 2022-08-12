import 'package:flutter/material.dart';
import 'package:roster_co/constants/category_title.dart';
import 'package:roster_co/widgets/category_appbar.dart';
import 'package:roster_co/widgets/category_detail_main_card.dart';

// ignore: must_be_immutable
class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({Key? key}) : super(key: key);
  TaskCategoryTitle titleTask = TaskCategoryTitle();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          CategoryAppBar(),
          CategoryDrawableCard(),
        ]),
      ),
    );
  }

  // Widget _buildAppBar() {
  //   return SliverAppBar(
  //     expandedHeight: 90,
  //     backgroundColor: Colors.black,
  //     leading: Padding(
  //       padding: const EdgeInsets.only(left: 15.0),
  //       child: IconButton(
  //         onPressed: () {
  //           Get.back();
  //         },
  //         icon: const FaIcon(
  //           FontAwesomeIcons.arrowLeftLong,
  //           size: 25,
  //         ),
  //       ),
  //     ),
  //     actions: [
  //       Padding(
  //         padding: const EdgeInsets.only(right: 8.0),
  //         child: IconButton(
  //           onPressed: () {},
  //           icon: const Image(
  //             image: AssetImage(
  //               'assets/icons/menu_icon_dark.png',
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //     flexibleSpace: FlexibleSpaceBar(
  //       title: Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             'Personal tasks',
  //             style: TextStyle(
  //                 fontFamily: 'Metropolis',
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.white,
  //                 fontSize: 16),
  //           ),
  //           const SizedBox(
  //             height: 5,
  //           ),
  //           Text(
  //             'Description about the task category',
  //             style: GoogleFonts.inter(
  //                 textStyle: TextStyle(
  //               fontSize: 10,
  //               color: Colors.grey[500],
  //             )),
  //           ),
  //           const SizedBox(
  //             height: 5,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
