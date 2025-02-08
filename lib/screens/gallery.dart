import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1_camera/screens/photoscreen.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
        ),
        itemCount: photo.length,
        itemBuilder: (context, index) {
          XFile data = photo[index];

          return InkWell(
            onTap: () {
              // datas = index;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => PhotoScreen(
                            pic: data,
                          )));
            },
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.file(
                height: 100,
                width: 100,
                File(data.path),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
