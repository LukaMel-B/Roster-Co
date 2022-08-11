import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Skip',
                  style: TextStyle(
                      color: Color(0xffABAAAA),
                      // color: Color(0xff388A75),
                      fontSize: 20),
                ),
                SizedBox(
                  width: 40,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
