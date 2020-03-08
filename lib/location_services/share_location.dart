import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:share/share.dart';

class ShareLocationScreen extends StatefulWidget {
  @override
  _ShareLocationScreenState createState() => _ShareLocationScreenState();
}

class _ShareLocationScreenState extends State<ShareLocationScreen> {

  // State variable.
  LocationData location;
  // Initialize state.
  void initState() {
    super.initState();
    retrieveLocation();
  }
  // Asynchronous function gets location data, to be called by init state.
  void retrieveLocation() async {
    var locationService = Location();
    location = await locationService.getLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Display a progress indicator while async location data not yet loaded.
    if (location==null) {
      return Center(child: CircularProgressIndicator());
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Latitude: ${location.latitude}',
              style: Theme.of(context).textTheme.headline5),
          Text('Longitude: ${location.longitude}',
              style: Theme.of(context).textTheme.headline5),
          RaisedButton(
            child: Text('Share'),
            onPressed: () {
              Share.share('Current Location: ${location.latitude}, ${location.longitude}');
            },
          ),
        ],
      ),
    );
  }
}