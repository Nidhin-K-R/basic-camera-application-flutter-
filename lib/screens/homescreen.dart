import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';

class HomeScreen extends StatelessWidget {
  final List<CameraDescription> camera;
  const HomeScreen({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CameraScreen(camera: camera)));
        },
        label: Text("Open Camera"),
        icon: Icon(Icons.camera_alt_outlined),
      )),
    );
  }
}
