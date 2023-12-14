import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class GalleriePage extends StatefulWidget {
  const GalleriePage({super.key});

  @override
  State<GalleriePage> createState() => _GalleriePageState();
}

class _GalleriePageState extends State<GalleriePage> {
  @override
  void initState() {
    super.initState();
    // audioPlayer = AudioPlayer()
    //   ..setSourceAsset('assets/foreground gallery sound.mp3');
    player.play(AssetSource('foreground gallery sound.mp3'), volume: 10);
  }

  final player = AudioPlayer();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.stop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // late AudioPlayer audioPlayer;

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
            child: Column(
              children: [
                const Text(
                  'Bastion 23',
                  style: TextStyle(
                      fontSize: 35, fontFamily: "Cinzel", color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Gallery',
                  style: TextStyle(
                      fontSize: 15, fontFamily: "Cinzel", color: Colors.white),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.white)),
                  child: PageView(
                    controller: pageController,
                    children: [
                      Image.asset(
                        'assets/' + listOfPics[0],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[1],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[2],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[3],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[4],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[5],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[6],
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/' + listOfPics[7],
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          pageController.previousPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.linear);
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: const Center(
                            child: Text(
                              "Previous",
                              style:
                                  TextStyle(fontSize: 15, fontFamily: "Cinzel"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.linear);
                        },
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                          child: const Center(
                            child: Text(
                              "Next",
                              style:
                                  TextStyle(fontSize: 15, fontFamily: "Cinzel"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> listOfPics = [
    'bastion1.jpg',
    'bastion2.jpg',
    'bastion3.jpg',
    'bastion4.jpg',
    'bastion5.jpg',
    'bastion6.jpg',
    'bastion7.jpg',
    'bastion8.jpg',
  ];

  PageController pageController = PageController();
}
