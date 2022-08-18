import 'package:flutter/material.dart';
import 'package:roster_co/screens/events/events_screen.dart';
import 'package:roster_co/screens/tasks/task_screen.dart';
import 'package:roster_co/widgets/home/bottom_nav_widget.dart';
import 'package:roster_co/widgets/home/floating_button.dart';
import 'package:roster_co/widgets/home/quotes_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final pages = const [MainTaskScreen(), MainEventScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: ValueListenableBuilder(
            valueListenable: selectedIndexNotifier,
            builder: (BuildContext context, int clickedIndex, Widget? _) {
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
      floatingActionButton: const CustomFloatingButton(
          page: SizedBox(),
          icon: Icon(
            Icons.add_rounded,
            size: 40,
          ),
          radius: 10),
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
