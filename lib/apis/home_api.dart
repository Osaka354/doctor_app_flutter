import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:doctor_app_fltter/models/home_model.dart';

Future<HomeModel> fetchHome() async {
  final response =
      await http.get(Uri.parse('https://doctor-app3.herokuapp.com/api'));

  if (response.statusCode == 200 || response.statusCode == 201) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return HomeModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
