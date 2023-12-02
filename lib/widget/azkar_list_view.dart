import 'package:azkar_app/models/azkar_model.dart';
import 'package:azkar_app/widget/azkar_item.dart';
import 'package:azkar_app/widget/azkar_localization.dart';
import 'package:flutter/material.dart';

import '../models/azkar_type.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key});

  @override
  Widget build(BuildContext context) {
    final azkarLocalization = AzkarLocalization(context);
    final List<AzkarModel> azkars = [
      AzkarModel(
        image: 'assets/images/morning.png',
        name: azkarLocalization.getMorningAzkar(),
      ),
      AzkarModel(
        image: 'assets/images/Night prayer.png',
        name: azkarLocalization.getNightPrayerAzkar(),
      ),
      AzkarModel(
        image: 'assets/images/Prayer.png',
        name: azkarLocalization.getPrayerAzkar(),
      ),
      AzkarModel(
        image: 'assets/images/Sleeep.png',
        name: azkarLocalization.getSleepAzkar(),
      ),
      AzkarModel(
        image: 'assets/images/Various.png',
        name: azkarLocalization.getVariousAzkar(),
      ),
      AzkarModel(
        image: 'assets/images/eveening.png',
        name: azkarLocalization.getEveningAzkar(),
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: azkars.length,
          itemBuilder: (context, index) {
            // final azkarType =
            //     index == 0 ? AzkarType.Morning : AzkarType.Evening;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: AzkarItem(
                azkar: azkars[index],
                //azkarType: azkarType,
              ),
            );
          }),
    );
  }
}
