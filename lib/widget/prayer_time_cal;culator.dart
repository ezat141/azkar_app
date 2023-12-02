import 'package:azkar_app/models/prayer_model.dart';

class PrayerTimeCalculator {
  final Data prayerData;

  PrayerTimeCalculator({required this.prayerData});

  DateTime _parseGregorianDate(String gregorianDateStr) {
    final dateParts = gregorianDateStr.split('-');
    if (dateParts.length == 3) {
      final year = int.parse(dateParts[2]);
      final month = int.parse(dateParts[1]);
      final day = int.parse(dateParts[0]);
      return DateTime(year, month, day);
    } else {
      throw FormatException('Invalid date format: $gregorianDateStr');
    }
  }

  Timings getTimings() {
    return prayerData.data.timings;
  }

  DateTime getPrayerTime(String prayerName) {
    final timings = getTimings();
    final gregorianDate =
        _parseGregorianDate(prayerData.data.date.gregorian.date);

    if (prayerName ==
        'Fajr (next day: ${gregorianDate.day}/${gregorianDate.month}/${gregorianDate.year})') {
      // This is a special case for the next day's Fajr
      final nextDay = DateTime(
          gregorianDate.year, gregorianDate.month, gregorianDate.day + 1);
      final fajrTime = DateTime(
        nextDay.year,
        nextDay.month,
        nextDay.day,
        int.parse(timings.fajr.split(":")[0]),
        int.parse(timings.fajr.split(":")[1]),
      );
      return fajrTime;
    }

    switch (prayerName) {
      case 'Fajr':
        final fajrTime = DateTime(
          gregorianDate.year,
          gregorianDate.month,
          gregorianDate.day,
          int.parse(timings.fajr.split(":")[0]),
          int.parse(timings.fajr.split(":")[1]),
        );
        return fajrTime;
      case 'Dhuhr':
        final dhuhrTime = DateTime(
          gregorianDate.year,
          gregorianDate.month,
          gregorianDate.day,
          int.parse(timings.dhuhr.split(":")[0]),
          int.parse(timings.dhuhr.split(":")[1]),
        );
        return dhuhrTime;
      case 'Asr':
        final asrTime = DateTime(
          gregorianDate.year,
          gregorianDate.month,
          gregorianDate.day,
          int.parse(timings.asr.split(":")[0]),
          int.parse(timings.asr.split(":")[1]),
        );
        return asrTime;
      case 'Maghrib':
        final maghribTime = DateTime(
          gregorianDate.year,
          gregorianDate.month,
          gregorianDate.day,
          int.parse(timings.maghrib.split(":")[0]),
          int.parse(timings.maghrib.split(":")[1]),
        );
        return maghribTime;
      case 'Isha':
        final ishaTime = DateTime(
          gregorianDate.year,
          gregorianDate.month,
          gregorianDate.day,
          int.parse(timings.isha.split(":")[0]),
          int.parse(timings.isha.split(":")[1]),
        );
        return ishaTime;
      default:
        throw Exception("Invalid prayer name: $prayerName");
    }
  }

  String getCurrentPrayer() {
    final currentDateTime = DateTime.now();
    final timings = getTimings();

    if (currentDateTime.isBefore(getPrayerTime('Fajr'))) {
      return 'Fajr';
    } else if (currentDateTime.isBefore(getPrayerTime('Dhuhr'))) {
      return 'Dhuhr';
    } else if (currentDateTime.isBefore(getPrayerTime('Asr'))) {
      return 'Asr';
    } else if (currentDateTime.isBefore(getPrayerTime('Maghrib'))) {
      return 'Maghrib';
    } else if (currentDateTime.isBefore(getPrayerTime('Isha'))) {
      return 'Isha';
    } else {
      // All prayers for today have passed, find the next day's Fajr
      final tomorrow = DateTime(
          currentDateTime.year, currentDateTime.month, currentDateTime.day + 1);
      return 'Fajr (next day: ${tomorrow.day}/${tomorrow.month}/${tomorrow.year})';
    }
  }

  Duration getTimeRemainingForPrayer(String prayerName) {
    final currentDateTime = DateTime.now();
    final prayerTime = getPrayerTime(prayerName);

    if (currentDateTime.isAfter(prayerTime)) {
      // If the prayer time has already passed, return a negative duration.
      return Duration.zero;
    }

    return prayerTime.difference(currentDateTime);
  }
}
