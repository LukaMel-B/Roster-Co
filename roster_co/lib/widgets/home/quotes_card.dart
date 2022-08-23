import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotesCard extends GetView {
  const QuotesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        height: 110,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 89, 89, 89),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.star,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Daily Motivation!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Metropolis',
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      'The question isn’t who’s going to let me, it’s who is going to stop me!',
                      style: GoogleFonts.inter(
                        textStyle:
                            TextStyle(color: Colors.grey[500], fontSize: 15),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
