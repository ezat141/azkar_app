import 'package:azkar_app/models/prayer_model.dart';
import 'package:azkar_app/generated/l10n.dart';
import 'package:azkar_app/services/prayer_service.dart';
import 'package:azkar_app/widget/prayer_time_cal;culator.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  Future<Data?> fetchPrayerData() async {
    try {
      return await PrayerService.getPrayerData();
    } catch (e) {
      print('Error fetching prayer data: $e');
      return null;
    }
  }

  String getCurrentPrayer(Data prayerData) {
    // Get the current time.
    final DateTime now = DateTime.now();

    // Iterate over the prayer times in the `data.timings` object.
    //var prayerData;
    for (var prayerTime in prayerData.data.timings.entries) {
      // Format the prayer time string as HH:mm
      final formattedTime =
          '${prayerTime.value.split(':')[0]}:${prayerTime.value.split(':')[1]}';
      // Parse the prayer time string into a `DateTime` object.
      //final DateTime prayerTimeDateTime = DateTime.parse(prayerTime.value);
      // Parse the formatted prayer time string into a `DateTime` object.
      final DateTime prayerTimeDateTime =
          DateTime.parse('2023-10-26 $formattedTime:00');

      // Find the prayer time that is closest to the current time.
      if (prayerTimeDateTime.isAfter(now)) {
        return prayerTime.key;
      }
    }

    // If the current time is after the last prayer time, then the current prayer is the last prayer time.
    return prayerData.data.timings.entries.last.key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<Data?>(
          future: fetchPrayerData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for the future to complete, display a loading indicator.
              return const CircularProgressIndicator();
            } else if (snapshot.hasError || snapshot.data == null) {
              // If an error occurs, display an error message.
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final prayerData = snapshot.data!;

              // Extract the necessary data for the AppBar.
              final hijriDate = prayerData.data.date.hijri;
              final day = hijriDate.day;
              final month = hijriDate.month.ar;
              final year = hijriDate.year;
              final appBarText = '$day $month, $year';
              final gregorianDatte = prayerData.data.date.gregorian;
              final weekDay = hijriDate.weekday.ar;
              final gregorianDay = gregorianDatte.day;
              final gregorianMonth = gregorianDatte.month.en;
              final appBarText2 = '$weekDay $gregorianDay, $gregorianMonth';

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //SizedBox(height: 10,),
                    Text(
                      appBarText2,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      appBarText,
                      style: const TextStyle(
                          color: Color(0xff859956), fontSize: 14),
                    ),
                  ],
                ),
              );
            } else {
              // Return a default widget or message when none of the conditions match.
              return const Text('No data available.');
            }
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<Data?>(
        future: fetchPrayerData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While waiting for the future to complete, display a loading indicator.
            return const CircularProgressIndicator();
          } else if (snapshot.hasError || snapshot.data == null) {
            // If an error occurs, display an error message.
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            final prayerData = snapshot.data!;

            final String currentPrayer = getCurrentPrayer(prayerData);
            // Calculate the remaining time for the current prayer.

            final DateTime nextPrayerTime;
            try {
              nextPrayerTime = prayerData.data.timings[currentPrayer]!;
            } catch (e) {
              // Handle the error if the current prayer is not found.
              print('Failed to get the next prayer time: $e');
              return const Text('Failed to get the next prayer time.');
            }
            final Duration timeRemainingForCurrentPrayer =
                nextPrayerTime.difference(DateTime.now());

            // Format the remaining time in a human-readable format.
            final String formattedTimeRemaining =
                timeRemainingForCurrentPrayer.toString().split('.')[0];

            // // Create an instance of PrayerTimeCalculator.
            //   final prayerTimeCalculator =
            //       PrayerTimeCalculator(prayerData: prayerData);

            //   // Get the current prayer and its time remaining.
            //   final currentPrayer = prayerTimeCalculator.getCurrentPrayer();
            //   final timeRemainingForCurrentPrayer =
            //       prayerTimeCalculator.getTimeRemainingForPrayer(currentPrayer);
            //       // Update the UI here with currentPrayer and timeRemainingForCurrentPrayer.

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff859956),
                    ),
                    padding: const EdgeInsets.only(
                        left: 16, top: 16, bottom: 30, right: 16),
                    child: Column(
                      children: [
                        Text(
                          prayerData.data.meta.timezone.split("/")[1],
                          style: const TextStyle(color: Colors.white),
                        ),
                        const Row(
                          children: [
                            Text(
                              'متبقي على',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'صلاة $currentPrayer',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                            Text(
                              formattedTimeRemaining,
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).fajr),
                            Text(snapshot.data!.data.timings.fajr),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).dhuhr),
                            Text(snapshot.data!.data.timings.dhuhr),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).asr),
                            Text(snapshot.data!.data.timings.asr),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).maghrib),
                            Text(snapshot.data!.data.timings.maghrib),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(S.of(context).isha),
                            Text(snapshot.data!.data.timings.isha),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Card(
                  //   child: Column(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: <Widget>[
                  //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(S.of(context).fajr),
                  //           Text(snapshot.data!.data.timings.fajr),

                  //         ],
                  //       ),
                  //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(S.of(context).dhuhr),
                  //           Text(snapshot.data!.data.timings.dhuhr),

                  //         ],
                  //       ),
                  //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(S.of(context).asr),
                  //           Text(snapshot.data!.data.timings.asr),

                  //         ],
                  //       ),
                  //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(S.of(context).maghrib),
                  //           Text(snapshot.data!.data.timings.maghrib),

                  //         ],
                  //       ),
                  //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(S.of(context).isha),
                  //           Text(snapshot.data!.data.timings.isha),

                  //         ],
                  //       ),

                  //     ],
                  //   ),
                  // ),
                ],
              ),
            );
            // return Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Row(
            //       children: [
            //          Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             children: [
            //               Text(S.of(context).fajr),
            //               Text(S.of(context).dhuhr),
            //               Text(S.of(context).asr),
            //               Text(S.of(context).maghrib),
            //               Text(S.of(context).isha),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Column(
            //             children: [
            //               Text(snapshot.data!.data.timings.fajr),
            //               Text(prayerData.data.timings.dhuhr),
            //               Text(prayerData.data.timings.asr),
            //               Text(prayerData.data.timings.maghrib),
            //               Text(prayerData.data.timings.isha),

            //             ],
            //           ),
            //         ),
            //         const Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Column(
            //             children: [
            //               Text('data'),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // );
          } else {
            // Return a default widget or message when none of the conditions match.
            return const Text('No data available.');
          }
        },
      ),
    );
  }
}
