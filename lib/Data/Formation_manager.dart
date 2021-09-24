import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ittalentsproject/Model/Formation_model.dart';






class Formation_manager
{
  static Future<List> get_formation() async
  {
    List<Formation> formations = [];
    var response = await http.get(
        Uri.parse("https://mdfive.dz/ecole/wp-json/wp/v2/formation"));
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);

    for(var u in jsonMap)
    {
      Formation formation = Formation.fromJson(u);
      print(2);
      formations.add(formation);
    }

    return formations;
  }
}