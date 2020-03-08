import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class FireStorerScreen extends StatefulWidget {
  @override
  _FireStorerScreenState createState() => _FireStorerScreenState();
}

class _FireStorerScreenState extends State<FireStorerScreen> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('test').snapshots(),
      builder: (content, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              var testPost = snapshot.data.documents[index];
              return ListTile(
                title: Text(testPost['Name']),
                subtitle: Text(testPost['How Many'].toString()),
                trailing: Text(testPost['done'].toString()),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}