import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:roster_co/controllers/category_db_controller.dart';
import 'package:roster_co/db/functions/category_db_functions.dart';
import 'package:roster_co/db/models/task_category_model.dart';
import 'package:roster_co/screens/home/home_screen.dart';

class WelcomeScreen extends GetView {
  WelcomeScreen({Key? key}) : super(key: key);
  final CategoryDbController _categorList = Get.put(CategoryDbController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Skip',
                    style: TextStyle(
                        color: Color(0xffABAAAA),
                        // color: Color(0xff388A75),
                        fontFamily: 'Metropolis',
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
              Text(
                'Roster Co',
                style: GoogleFonts.rancho(
                  textStyle: const TextStyle(fontSize: 52),
                ),
              ),
              SizedBox(
                child: Image.asset(
                  'assets/images/welcome_img.png',
                  width: 275,
                ),
              ),
              const Text(
                'Welcome!',
                style: TextStyle(fontFamily: 'Metropolis', fontSize: 25),
              ),
              Text(
                'Welcome to our world,\nHere you can make yourself \nbetter each day!',
                textAlign: TextAlign.center,
                style: GoogleFonts.indieFlower(
                  textStyle:
                      const TextStyle(fontSize: 21, color: Color(0xff717171)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          defaultCategory();
          Get.offAll(
            () => HomeScreen(),
            transition: Transition.cupertino,
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 25,
        backgroundColor: Colors.black,
        child: const Icon(
          FontAwesomeIcons.arrowRightLong,
          size: 25,
        ),
      ),
    );
  }

  defaultCategory() async {
    if (_categorList.categoryDb.isEmpty) {
      _categorList.initalIndex();
      _categorList.updateIndex();
      final categoryPersonal = TaskCategoryModel(
          icon: FontAwesomeIcons.solidUser.codePoint,
          title: 'Personal',
          description: 'Here i update my personal related tasks',
          bgColor: _categorList.bgColorList[_categorList.bgColorIndex],
          iconColor: _categorList.iconColorList[_categorList.iconColorIndex]);
      await addCategory(categoryPersonal);
      await getAllCategorys();
      _categorList.updateIndex();
      final categoryWork = TaskCategoryModel(
          icon: FontAwesomeIcons.briefcase.codePoint,
          title: 'Work',
          description: 'Here i update my work related tasks',
          bgColor: _categorList.bgColorList[_categorList.bgColorIndex],
          iconColor: _categorList.iconColorList[_categorList.iconColorIndex]);
      await addCategory(categoryWork);
      await getAllCategorys();
      _categorList.updateIndex();
      final categoryHealth = TaskCategoryModel(
          icon: FontAwesomeIcons.solidHeart.codePoint,
          title: 'Health',
          description: 'Here i update my health related tasks',
          bgColor: _categorList.bgColorList[_categorList.bgColorIndex],
          iconColor: _categorList.iconColorList[_categorList.iconColorIndex]);
      await addCategory(categoryHealth);
      await getAllCategorys();
    } else {
      _categorList.initalIndex();
    }
  }
}
