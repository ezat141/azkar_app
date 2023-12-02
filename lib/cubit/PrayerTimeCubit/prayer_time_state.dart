import '../../models/prayer_model.dart';

class PrayerTimeState {
  final Data? prayerData;
  final Duration timeRemaining;
  final String nextPrayerName;

  PrayerTimeState({this.prayerData, this.timeRemaining = const Duration(), this.nextPrayerName = ''});

  // Define a copyWith method to create a new instance of the state with updated values
  PrayerTimeState copyWith({
    Data? prayerData,
    Duration? timeRemaining,
    String? nextPrayerName,
  }) {
    return PrayerTimeState(
      prayerData: prayerData ?? this.prayerData,
      timeRemaining: timeRemaining ?? this.timeRemaining,
      nextPrayerName: nextPrayerName ?? this.nextPrayerName,
    );
  }
}