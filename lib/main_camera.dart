import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

late String _imagePath;

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    // Initialize the controller asynchronously
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    try {
      // Dispose of the controller when the widget is disposedpr

      _controller.dispose();
      print("disposed -------------------");
      _saveImage();
    } catch (e) {
      print('Error disposing camera: $e');
    }
    super.dispose();
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

  Future<void> _saveImage() async {

    await GallerySaver.saveImage(_imagePath);

  }

  // Function to request storage permission
  Future<bool> _requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    return status == PermissionStatus.granted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a Picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture 2')),
      body: Column(
        children: [
          Image.file(File(imagePath)),
          Text("SAVED SUCCESSFULLY")
          // ElevatedButton(
          //   onPressed: () {
          //     print('clicked save button');
          //     // Save the image to the system's gallery
          //     (context as Element)
          //         .findAncestorStateOfType<TakePictureScreenState>()
          //         ?._saveImage();
          //   },
          //   child: Container(
          //       height: 80,
          //       width: 80,
          //       color: Colors.orange,
          //       child: const Text('Save')),
          // ),
        ],
      ),
    );
  }
}
