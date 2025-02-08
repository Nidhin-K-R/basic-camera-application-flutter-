import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1_camera/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(camera: cameras),
    ),
  );
}
