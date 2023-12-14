import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Stack(
                  children: [
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight,
                      child: Image.asset(
                        'assets/background.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Color.fromRGBO(0, 0, 0, 0.1),
                  Colors.transparent,
                  // ... Add more steps if desired
                ],
                stops: [0.0, 0.9, 1.0], // Adjust stops for smoother gradient
              ),
            ),
          ),
          Positioned(
            top: 67,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: SizedBox(
                height: 30,
                width: 50,
                child: Image.asset("assets/Line 1.png"),
              ),
            ),
          ),
          Positioned(
            top: 60,
            child: SizedBox(
              width: screenWidth * 0.9,
              height: screenHeight,
              child: Column(
                children: [
                  const Text(
                    'Bastion 23',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Cinzel",
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Information',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Cinzel",
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: screenWidth * 0.9,
                    child: const Text(
                      'The Palais des Rais (Arabic: قصر الرياس), also known as Bastion 23, is a classified historical monument located in Algiers, Algeria. It is notable for its architecture and for being the last surviving quarter (houma) of the lower Casbah Consisting of three palaces and six houses, whose history began with the construction of Bordj-Ez-zoubia in 1576 by the Dey Ramdhan Pasha in order to reinforce the means of defense of this side of the Medina, this quarter ended up being detached, and even isolated from its traditional environment following the restructuring of the lower Casbah during the French period. It was not until 1909 that Bastion 23 was classified as a Historical Monument under the name Group of Moorish houses',
                      style: TextStyle(
                          fontSize: 17,
                         // fontFamily: "Cinzel",
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
