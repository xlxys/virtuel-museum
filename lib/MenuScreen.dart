import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tpcamera/Gallerie.dart';
import 'package:tpcamera/InformationPage.dart';
import 'package:tpcamera/qrcodeAR.dart';


class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  late CameraDescription firstCamera;
  cameraSetUp() async {
    final cameras = await availableCameras();
    firstCamera = cameras.first;
  }

  String myImagePath = "";

  Future getImage() async {
    final imagePicker = ImagePicker();
    // using your method of getting an image
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.camera);

// getting a directory path for saving
    final String path = "/storage/emulated/0/Download/";

// copy the file to a new path
    if (image != null) {
      await image.saveTo('$path/${DateTime.now().millisecond}.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(
          future: cameraSetUp(),
          builder: (context, snap) {
            return Stack(
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
                          Container(
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
                      stops: [
                        0.0,
                        0.9,
                        1.0
                      ], // Adjust stops for smoother gradient
                    ),
                  ),
                ),
                const Positioned(
                  top: 60,
                  child: Text(
                    'Bastion 23',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Cinzel",
                        color: Colors.white),
                  ),
                ),
                Column(
                  children: [
                    Expanded(child: Container()),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const GalleriePage(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 350));
                            },
                            child: menuItem(context, 'Vector.png', "Gallery")),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const InformationPage(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 350));
                            },
                            child: menuItem(context, '!.png', "Information")),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: menuItem(
                            context,
                            'Vector-1.png',
                            "Camera",
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => const QRViewExample(),
                                  transition: Transition.rightToLeft,
                                  duration: const Duration(milliseconds: 350));
                            },
                        child: menuItem(context, 'Vector-2.png', 'Bastion 3d')),
                        Expanded(child: Container()),
                      ],
                    ),
                    Expanded(child: Container()),
                  ],
                )
              ],
            );
          }),
    );
  }

  Widget menuItem(context, String imageAssetName, String menuName) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: screenWidth * 0.35,
          decoration:
              BoxDecoration(border: Border.all(width: 3, color: Colors.white)),
          child: Center(
            child: Image.asset('assets/' + imageAssetName),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          menuName,
          style: const TextStyle(
              fontSize: 15, fontFamily: "Cinzel", color: Colors.white),
        )
      ],
    );
  }
}
