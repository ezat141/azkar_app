import 'package:azkar_app/cubit/UpdatedPrayerTimeCubit/updated_prayer_time_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/prayer_model.dart';
import '../../services/prayer_service.dart';
import '../PrayerTimeCubit/prayer_time_state.dart';

class UpdatedPrayerTimeCubit extends Cubit<UpdatedPrayerTimeState> {
  UpdatedPrayerTimeCubit() : super(PrayerTimeLoading());
  Future<void> fetchData() async {
    try {
      // Replace PrayerService with your actual service class to fetch data.
      final prayerData = await PrayerService.getPrayerData();
      emit(PrayerTimeLoaded(prayerData));
    } catch (e) {
      emit(PrayerTimeError(e.toString()));
    }
  }
}
