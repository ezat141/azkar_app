import 'package:azkar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_gen/gen_l10n/azkar_names.dart'; // Import your generated localization file

class AzkarLocalization {
  final BuildContext context;

  AzkarLocalization(this.context);

  String getMorningAzkar() {
    return S.of(context).morningAzkar;
  }

  String getEveningAzkar() {
    return S.of(context).eveningAzkar;
  }

  String getPrayerAzkar() {
    return S.of(context).prayerAzkar;
  }

  String getSleepAzkar() {
    return S.of(context).sleepAzkar;
  }

  String getVariousAzkar() {
    return S.of(context).variousAzkar;
  }

  String getNightPrayerAzkar() {
    return S.of(context).nightPrayerAzkar;
  }
}
