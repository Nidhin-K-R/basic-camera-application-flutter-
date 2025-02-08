import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/screens/gallery.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> camera;
  const CameraScreen({super.key, required this.camera});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

XFile? capturedImage;
List<XFile> photo = [];

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool rearCamera = true;
  late Future futureController;
  var cm = 0;

  Future<void> _initializeCamera(CameraDescription camera) async {
    _controller = CameraController(camera, ResolutionPreset.high);

    futureController = _controller.initialize();
  }

  @override
  void initState() {
    _initializeCamera(widget.camera[cm]);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async {
          XFile image = await _controller.takePicture();

          setState(() {
            capturedImage = image;
            photo.add(capturedImage!);
          });
          //  photo.add(capturedImage);
          print("saved picture");
        },
        child: Icon(
          Icons.camera_alt_rounded,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder(
          future: futureController,
          builder: (context, index) {
            if (index.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_controller),
                  ),
                  Positioned(
                    //top: 100,
                    bottom: 20,
                    left: 30,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => Gallery()));
                        //  photo.add(capturedImage!);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        color: Colors.grey,
                        child: capturedImage == null
                            ? Icon(
                                Icons.settings_backup_restore_outlined,
                                color: Colors.blueGrey,
                              )
                            : Image.file(
                                File(capturedImage!.path),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 30,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            rearCamera = !rearCamera;
                            rearCamera ? cm = 0 : cm = 1;
                            _initializeCamera(widget.camera[cm]);
                          });
                          //print("pressed");
                        },
                        icon: Icon(
                          Icons.cameraswitch_outlined,
                          size: 50,
                          color: Colors.grey,
                        )),
                  )
                ],
              );
              //Expanded(child: CameraPreview(_controller));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
