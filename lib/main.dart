import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:tpcamera/MenuScreen.dart';

void main() {
  runApp(const FinalProject());
}

class FinalProject extends StatelessWidget {
  const FinalProject({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const Scaffold(
        body: MainActivity(),
      ),
    );
  }
}

class MainActivity extends StatelessWidget {
  const MainActivity({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  child: Image.asset(
                    'assets/background.jpg',
                    fit: BoxFit.cover,
                  ),
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
                stops: [0.0, 0.8, 1.0], // Adjust stops for smoother gradient
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(30),
              width: screenWidth * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bastion 23',
                    style: TextStyle(fontSize: 35, fontFamily: "Cinzel"),
                  ),
                  Container(
                    child: const Text(
                      'The Palais des Rais, also known as Bastion 23, is a classified historical monument located in Algiers, Algeria. It is notable for its architecture and for being the last surviving quarter of the lower Casbah.',
                      style: TextStyle(fontSize: 15,
                          //fontFamily: "Cinzel"
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked");
                      Get.to(() => MenuScreen(),
                          transition: Transition.rightToLeft,
                          duration: const Duration(milliseconds: 350));
                    },
                    child: SizedBox(
                      width: screenWidth,
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2)),
                            child: const Center(
                              child: Text(
                                "Start",
                                style: TextStyle(
                                    fontSize: 15, fontFamily: "Cinzel"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
