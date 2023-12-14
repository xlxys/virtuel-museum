// import 'dart:async';
// import 'dart:io';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final cameras = await availableCameras();
//   final firstCamera = cameras.first;

//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         scaffoldBackgroundColor: Color(0xFFbca89f), // Faded cream color
//       ),
//       initialRoute: 'landing',
//       routes: {
//         'landing': (context) => LandingScreen(),
//         'first': (context) => FirstScreen(),
//         'second': (context) => SecondScreen(),
//         'third': (context) => ThirdScreen(),
//         'fourth': (context) => FourthScreen(),
//         'camera': (context) => TakePictureScreen(camera: firstCamera),
//       },
//     ),
//   );
// }

// class LandingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'images/background.jpg',
//             fit: BoxFit.cover,
//           ),
//           BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//             child: Container(
//               color: Colors.black.withOpacity(0.2),
//             ),
//           ),
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   color: Colors.white,
//                   padding: EdgeInsets.all(16),
//                   child: Text(
//                     'WELCOME',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'first');
//                   },
//                   child: Text("Start Gallery"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.photo),
//             label: 'Gallery',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.camera),
//             label: 'Camera',
//           ),
//         ],
//         onTap: (index) {
//           if (index == 0) {
//             Navigator.pushNamed(context, 'first');
//           } else if (index == 1) {
//             Navigator.pushNamed(context, 'camera');
//           }
//         },
//       ),
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Bastion23')),
//         backgroundColor: Color(0xFF5b3e31), // Darker shade of background
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'images/bastion1.jpg',
//               height: 600,
//               width: 600,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'second');
//                   },
//                   child: Text("Next"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Bastion23')),
//         backgroundColor: Color(0xFF5b3e31), // Darker shade of background
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'images/bastion2.jpg',
//               height: 600,
//               width: 600,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("Go Back"),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'third');
//                   },
//                   child: Text("Next"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ThirdScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Bastion23')),
//         backgroundColor: Color(0xFF5b3e31), // Darker shade of background
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'images/bastion3.jpg',
//               height: 600,
//               width: 600,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("Go Back"),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pushNamed(context, 'fourth');
//                   },
//                   child: Text("Next"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FourthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Bastion23')),
//         backgroundColor: Color(0xFF5b3e31), // Darker shade of background
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'images/bastion4.jpg',
//               height: 600,
//               width: 600,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Color(0xFF5b3e31)), // Same color as AppBar
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text("Go Back"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TakePictureScreen extends StatefulWidget {
//   const TakePictureScreen({
//     Key? key,
//     required this.camera,
//   }) : super(key: key);

//   final CameraDescription camera;

//   @override
//   TakePictureScreenState createState() => TakePictureScreenState();
// }

// class TakePictureScreenState extends State<TakePictureScreen> {
//   late CameraController _controller;
//   late Future<void> _initializeControllerFuture;

//   @override
//   void initState() {
//     super.initState();
//     _controller = CameraController(
//       widget.camera,
//       ResolutionPreset.medium,
//     );
//     _initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Take a Picture')),
//       body: FutureBuilder<void>(
//         future: _initializeControllerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return CameraPreview(_controller);
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           try {
//             await _initializeControllerFuture;
//             final image = await _controller.takePicture();
//             if (!mounted) return;
//             await Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => DisplayPictureScreen(imagePath: image.path),
//               ),
//             );
//           } catch (e) {
//             print(e);
//           }
//         },
//         child: const Icon(Icons.camera_alt),
//       ),
//     );
//   }
// }

// class DisplayPictureScreen extends StatelessWidget {
//   final String imagePath;

//   const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Display the Picture')),
//       body: Image.file(File(imagePath)),
//     );
//   }
// }
