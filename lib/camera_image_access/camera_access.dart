import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CameraAccessScreen extends StatefulWidget {
  @override
  _CameraAccessScreenState createState() => _CameraAccessScreenState();
}

class _CameraAccessScreenState extends State<CameraAccessScreen> {

  File image;

  void getCameraImage() async {
    // TODO: add logic to address camera permission denial or error branch.
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    StorageReference storageReference =
    FirebaseStorage.instance.ref().child('myCameraImage'+DateTime.now().toString()+'.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    final url = await storageReference.getDownloadURL();
    print(url);
    setState(() {});
  }
  void getGalleryImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    StorageReference storageReference =
    FirebaseStorage.instance.ref().child('myGalleryImage'+DateTime.now().toString()+'.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    final url = await storageReference.getDownloadURL();
    print(url);
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