import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CameraAccessScreen extends StatefulWidget {
  @override
  _CameraAccessScreenState createState() => _CameraAccessScreenState();
}

class _CameraAccessScreenState extends State<CameraAccessScreen> {

  File image;

  void getCameraImage() async {
    // TODO: add logic to address camera permission denial or error branch.
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }
  void getGalleryImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image==null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Take a Photo'),
              onPressed: () {
                getCameraImage();
              },
            ),
            RaisedButton(
              child: Text('Select an Image'),
              onPressed: () {
                getGalleryImage();
              },
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(image),
            SizedBox(height: 40),
            RaisedButton(
              child: Text('Post Photo'),
              onPressed: () {
              },
            )
          ],
        ),
      );
    }

  }
}