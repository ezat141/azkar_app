import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:azkar_app/models/azkar_model.dart';

import '../models/azker_content_model.dart';

class AzkarService {
  final String apiUrl =
      'https://ahegazy.github.io/muslimKit/json/azkar_sabah.json';
  final String apiUrl2 =
      'https://ahegazy.github.io/muslimKit/json/azkar_massa.json#';

  Future<Data> fetchMorningAzkarData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Data.fromJson(jsonData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<Data> fetchEveningAzkarData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl2));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return Data.fromJson(jsonData);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }


}
