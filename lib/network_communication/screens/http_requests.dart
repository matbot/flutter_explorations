// Begin by adding the 'http' package to pubspec.yaml and pug get.
// Uses Star Wars swapi.co api.
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Namespace the http package to prevent collision with global functions.
import 'package:http/http.dart' as http;
import 'package:explorations/network_communication/models/character.dart';

class HttpRequestScreen extends StatefulWidget {
  // Define a const url endpoint here bc it doesn't change with the widget state.
  static const URL = 'https://swapi.co/api/people/1';
  @override
  _HttpRequestScreenState createState() => _HttpRequestScreenState();
}

class _HttpRequestScreenState extends State<HttpRequestScreen> {
  // Define a Future to be used in the FutureBuilder as snapshot.
  Future<http.Response> apiResponse = http.get(HttpRequestScreen.URL);

  @override
  Widget build(BuildContext context) {
    // Use a future builder!
    return FutureBuilder(
      future: apiResponse,
      builder: (context, snapshot) {
        Widget child;
        // TODO: add error handling http response/future snapshot.
        if (snapshot.hasData) {
          Character character = Character.fromJSON(jsonDecode(snapshot.data.body));
          child = Text(
              '${character.name}\n${character.gender}\n${character.height}',
              style: Theme.of(context).textTheme.headline5);
        } else {
          child = CircularProgressIndicator();
        }
        return Center(child: child);
      },
    );
  }
}