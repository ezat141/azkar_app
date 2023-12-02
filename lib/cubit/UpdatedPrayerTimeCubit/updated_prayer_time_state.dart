import '../../models/prayer_model.dart';

abstract class UpdatedPrayerTimeState {}

class PrayerTimeLoading extends UpdatedPrayerTimeState {
}

class PrayerTimeLoaded extends UpdatedPrayerTimeState {
  final Data prayerData;

  PrayerTimeLoaded(this.prayerData);
}

class PrayerTimeError extends UpdatedPrayerTimeState {
  final String errorMessage;
  PrayerTimeError(this.errorMessage);

}
