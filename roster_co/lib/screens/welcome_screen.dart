import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              height: 40,
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: const Icon(
          FontAwesomeIcons.arrowRight,
          color: Colors.white,
          size: 25,
        ),
        onPressed: () {},
      ),
    );
  }
}
