Create firebase project and download config file to project root.
Implement google services gradle plugin: https://firebase.google.com/docs/flutter/setup
Note that google-services.json needs to be in app/ and both
    /build.gradle and /app/build.gradle need to be updated.
Another setup walkthrough, wish these were dated: https://codelabs.developers.google.com/codelabs/flutter-firebase/#4
More recent walkthrough:https://medium.com/@atul.sharma_94062/how-to-use-cloud-firestore-with-flutter-e6f9e8821b27
import 'package:cloud_firestore/cloud_firestore.dart';
Under /app/build.grade had to add to defaultConfig: multiDexEnabled true