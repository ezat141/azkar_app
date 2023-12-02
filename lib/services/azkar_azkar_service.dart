import 'package:flutter/services.dart';
import 'dart:convert';

import '../models/azkar_azkar.dart';



class AzkarAzkarService {
  static Future<List<AzkarAzkarModel>> fetchAdhkarData() async {
    final jsonStr = await rootBundle.loadString('assets/adhkar.json');
    final List<dynamic> jsonData = json.decode(jsonStr);
    return jsonData.map((jsonData) => AzkarAzkarModel.fromJson(jsonData)).toList();
  }
}
