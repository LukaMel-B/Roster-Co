import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryAppBar extends GetView {
  final String category;
  final String description;
  const CategoryAppBar(
      {required this.description, required this.category, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeftLong,
            size: 25,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(
                'assets/icons/menu_icon_dark.png',
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$category tasks',
              style: const TextStyle(
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              description,
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                fontSize: 10,
                color: Colors.grey[500],
              )),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
