import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhotoScreen extends StatelessWidget {
  XFile pic;
  PhotoScreen({super.key, required this.pic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Photo"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Image.file(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        File(pic.path),
        fit: BoxFit.cover,
      ),
    );
  }
}
