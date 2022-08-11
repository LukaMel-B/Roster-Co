import 'package:flutter/material.dart';
import 'package:roster_co/widgets/quotes_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: const [
            QuotesCard(),
          ],
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
