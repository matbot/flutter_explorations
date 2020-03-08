import 'package:explorations/firestore_fun/firestorer.dart';
import 'package:explorations/network_communication/screens/http_requests.dart';
import 'package:flutter/material.dart';
import 'package:explorations/camera_image_access/camera_access.dart';
import 'package:explorations/location_services/share_location.dart';

void main() => runApp(Explor());

class Explor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Explorations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Explorationer'),
              centerTitle: true,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.location_on)),
                  Tab(icon: Icon(Icons.photo_camera)),
                  Tab(icon: Icon(Icons.network_check)),
                  Tab(icon: Icon(Icons.storage)),
                ],
              ),
            ),
              body: TabBarView(
                children: <Widget>[
                  ShareLocationScreen(),
                  CameraAccessScreen(),
                  HttpRequestScreen(),
                  FireStorerScreen(),
                ],
              ),
          ),
        ),
      ),
    );
  }
}
