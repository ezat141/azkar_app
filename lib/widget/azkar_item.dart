import 'package:azkar_app/models/azkar_model.dart';
import 'package:azkar_app/view/azkar_screen.dart';
import 'package:flutter/material.dart';

import '../models/azkar_type.dart';
import '../services/azkar_azkar_service.dart';

class AzkarItem extends StatelessWidget {
  const AzkarItem({super.key, required this.azkar});
  final AzkarModel azkar;
  //final AzkarType azkarType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToAzkarScreen(context, azkar.name),
      child: Container(
        decoration: BoxDecoration(
          //color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          image:  DecorationImage(
            image: AssetImage(azkar.image), fit: BoxFit.fill),
        ),
        padding: const EdgeInsets.only(left: 16, top: 30, bottom: 30, right: 16),
        child:  Row(
         // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              azkar.name,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white),
            ),
          ],
        ),
    
      ),
    );
  }

  void navigateToAzkarScreen(BuildContext context, String categoryName) async {
    // Fetch data from the API using the service
    final adhkarData = await AzkarAzkarService.fetchAdhkarData();

    // Capture the context before the async operation
  BuildContext capturedContext = context;

    // Filter data based on the category name
    final filteredData = adhkarData
        .where((data) => data.category == categoryName)
        .expand((data) => data.array)
        .toList();

    // Navigate to the category screen with the filtered data
    Navigator.push(
      capturedContext,
      MaterialPageRoute(
        builder: (context) => AzkarScreen(adhkarData: filteredData, categoryName: categoryName,),
      ),
    );
  }
}