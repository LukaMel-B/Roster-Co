import 'package:flutter/material.dart';
import 'package:roster_co/screens/events/events_screen.dart';
import 'package:roster_co/screens/home/home_common_page.dart';
import 'package:roster_co/screens/tasks/task_screen.dart';
import 'package:roster_co/widgets/bottom_nav_widget.dart';
import 'package:roster_co/widgets/quotes_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final pages = const [MainTaskScreen(), MainEventScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int clickedIndex, Widget? _) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [const QuotesCard(), pages[clickedIndex]],
                  ),
                ),
              ],
            );
            ;
          }),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add_rounded,
          size: 36,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Container(
        padding: const EdgeInsets.all(8),
        height: 45,
        width: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset('assets/images/profile_pic.jpeg'),
        ),
      ),
      title: const Text(
        'Hi, Luha!',
        style: TextStyle(
            color: Colors.black, fontSize: 24, fontFamily: 'Metropolis'),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Image(
            image: AssetImage(
              'assets/icons/menu_icon.png',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
