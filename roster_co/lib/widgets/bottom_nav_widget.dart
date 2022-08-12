import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:roster_co/screens/home/home_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 6,
                blurRadius: 10)
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: ValueListenableBuilder(
          builder: (BuildContext context, int updatedIndex, Widget? _) {
            return BottomNavigationBar(
              currentIndex: updatedIndex,
              onTap: (newIndex) {
                HomeScreen.selectedIndexNotifier.value = newIndex;
              },
              selectedItemColor: const Color(0xff3078E5),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: Padding(
                      padding: EdgeInsets.only(right: 30.0, top: 5, bottom: 5),
                      child: FaIcon(FontAwesomeIcons.house),
                    )),
                BottomNavigationBarItem(
                    label: 'Events',
                    icon: Padding(
                      padding: EdgeInsets.only(left: 35.0, top: 5, bottom: 5),
                      child: FaIcon(
                        FontAwesomeIcons.solidUser,
                      ),
                    )),
              ],
            );
          },
          valueListenable: HomeScreen.selectedIndexNotifier,
        ),
      ),
    );
  }
}
