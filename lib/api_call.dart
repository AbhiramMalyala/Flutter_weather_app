import 'dart:convert';
// import 'package:flutter/material.dart';
import './secrect.dart';
import 'package:http/http.dart' as http;

class Api_data {
  String place = 'Hyderabad';
  String city = 'India';
  void naming(String s) {
    place = s;
  }

  Future<Map<String, dynamic>> Find() async {
    try {
      var url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$place,$city&APPID=$Api_key');
      var data = await http.get(url);
      if (data.statusCode != 200) {
        throw 'an unexpexted error occured';
      }
      // print(data.body);
      return jsonDecode(data.body);
    } catch (e) {
      throw 'an unexpexted error occured';
    }
  }
}
