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

  Character character;

  void initState() {
    super.initState();
    getCharacterData();
  }

  void getCharacterData() async {
    final http.Response apiResponse = await http.get(HttpRequestScreen.URL);
    character = Character.fromJSON(jsonDecode(apiResponse.body));
    print(character);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Use a future builder!
    return Center(child: CircularProgressIndicator());
  }
}