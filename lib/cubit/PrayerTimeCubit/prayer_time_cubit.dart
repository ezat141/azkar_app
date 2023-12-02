import 'dart:async';

import 'package:azkar_app/cubit/PrayerTimeCubit/prayer_time_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/prayer_model.dart';
import '../../services/prayer_service.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  Timer? timer;
  
  PrayerTimeCubit() : super(PrayerTimeState()) {
    fetchPrayerData();
  }

  Future<void> fetchPrayerData() async {
    try {
      final prayerData = await PrayerService.getPrayerData();
      updateNextPrayerTimeRemaining(prayerData);
      // Start the timer for periodic updates
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        updateNextPrayerTimeRemaining(prayerData);
      });
      
      
    } catch (e) {
      print('Error fetching prayer data: $e');
    }
  }

  void updateNextPrayerTimeRemaining(Data? prayerData) {
    if (prayerData != null) {
      final now = DateTime.now();
      for (String prayerName in prayerData.data.timings.entries.map((e) => e.key)) {// explain it 
        final prayerTime = prayerData.data.timings[prayerName];
        final prayerDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          int.parse(prayerTime.split(":")[0]),
          int.parse(prayerTime.split(":")[1]),
        );

        if (prayerDateTime.isAfter(now)) {
          final difference = prayerDateTime.difference(now);
          emit(state.copyWith(
            prayerData: prayerData,
            timeRemaining: difference,
            nextPrayerName: prayerName,
          ));
          return;
        }
      }
    }
    emit(state.copyWith(
      prayerData: prayerData,
      timeRemaining: const Duration(),
      nextPrayerName: 'No upcoming prayer',
    ));
  }

  @override
  Future<void> close() {
    // Cancel the timer when the cubit is closed
    timer?.cancel();
    return super.close();
  }
}