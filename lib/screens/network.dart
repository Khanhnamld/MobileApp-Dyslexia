import 'dart:convert';

import 'package:flutter_task_planner_app/screens/search_plant.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  static Future<List<Plant>> getPlants(String query) async {
    final url = Uri.parse(
        'https://plant-app-ubest.herokuapp.com/Cay');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // final List plants = json.decode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> plants= map["Cay"];
      return plants.map((json) => Plant.fromJson(json)).where((Plant) {
        final titleLower = Plant.title.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}