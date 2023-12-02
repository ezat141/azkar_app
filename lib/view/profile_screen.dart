import 'dart:async';

import 'package:azkar_app/services/prayer_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../cubit/PrayerTimeCubit/prayer_time_cubit.dart';
import '../cubit/PrayerTimeCubit/prayer_time_state.dart';
import '../cubit/UpdatedPrayerTimeCubit/updated_prayer_time_cubit.dart';
import '../cubit/UpdatedPrayerTimeCubit/updated_prayer_time_state.dart';
import '../generated/l10n.dart';
import '../models/prayer_model.dart';
import '../widget/prayer_time_details.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Data? prayerData;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchPrayerData();
  // }

  // Future<void> fetchPrayerData() async {
  //   try {
  //     prayerData = await PrayerService.getPrayerData();
  //     setState(() {});
  //   } catch (e) {
  //     print('Error fetching prayer data: $e');
  //   }
  // }
// }//end of class

  // final prayerNameMap = {
  //   'Fajr': 'الفجر',
  //   'Dhuhr': 'الظهر',
  //   'Asr': 'العصر',
  //   'Maghrib': 'المغرب',
  //   'Isha': 'العشاء',
  //   // Add more prayer names as needed
  // };

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Prayer Times'),
  //     ),
  //     body: prayerData == null
  //         ? Center(child: CircularProgressIndicator())
  //         : ListView.builder(
  //             itemCount: prayerData!.data.timings.entries.length,
  //             itemBuilder: (context, index) {
  //               final entry = prayerData!.data.timings.entries.elementAt(index);
  //               final prayerName = entry.key;
  //               final arabicPrayerName = prayerNameMap[prayerName] ?? prayerName;
  //               final prayerTime = entry.value;
  //               final now = DateTime.now();
  //               var timeRemaining = DateTime(
  //                   now.year,
  //                   now.month,
  //                   now.day,
  //                   int.parse(prayerTime.split(":")[0]),
  //                   int.parse(prayerTime.split(":")[1]));
  //               if (timeRemaining.isBefore(now)) {
  //                 // If the prayer time is earlier than the current time, add one day to it
  //                 timeRemaining = timeRemaining.add(const Duration(days: 1));
  //               }
  //               final difference = timeRemaining.difference(now);
  //               final hours = difference.inHours;
  //               final minutes = (difference.inMinutes % 60);

  //               return ListTile(
  //                 title: Text('Prayer: $prayerName'),
  //                 subtitle: Text(
  //                   'Time Remaining: $hours h $minutes m',
  //                 ),
  //               );
  //             },
  //           ),
  //   );
  // }
// ##########################################################################################################
//   Data? prayerData;
//   List<String> prayerNames = [
//     'Fajr',
//     'Dhuhr',
//     'Asr',
//     'Maghrib',
//     'Isha',
//     'Imsak',
//     'Midnight',
//     'Firstthird',
//     'Lastthird',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     fetchPrayerData();
//   }

//   Future<void> fetchPrayerData() async {
//     try {
//       prayerData = await PrayerService.getPrayerData();
//       setState(() {});
//     } catch (e) {
//       print('Error fetching prayer data: $e');
//     }
//   }

//   final prayerNameMap = {
//     'Fajr': 'الفجر',
//     'Dhuhr': 'الظهر',
//     'Asr': 'العصر',
//     'Maghrib': 'المغرب',
//     'Isha': 'العشاء',
//     'Imsak': 'الإمساك',
//     'Midnight': 'منتصف الليل',
//     'Firstthird': 'الثلث الأول من الليل',
//     'Lastthird': 'الثلث الأخير من الليل',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Prayer Times'),
//       ),
//       body: prayerData == null
//           ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: prayerNames.length,
//               itemBuilder: (context, index) {
//                 final prayerName = prayerNames[index];
//                 final arabicPrayerName =
//                     prayerNameMap[prayerName] ?? prayerName;
//                 final prayerTime = prayerData!.data.timings[prayerName];
//                 final now = DateTime.now();
//                 var prayerDateTime = DateTime(
//                     now.year,
//                     now.month,
//                     now.day,
//                     int.parse(prayerTime.split(":")[0]),
//                     int.parse(prayerTime.split(":")[1]));

//                 if (prayerDateTime.isBefore(now)) {
//                   // If the prayer time is earlier than the current time, add one day to it
//                   prayerDateTime = prayerDateTime.add(const Duration(days: 1));
//                 }

//                 final difference = prayerDateTime.difference(now);
//                 final hours = difference.inHours;
//                 final minutes = (difference.inMinutes % 60);

//                 String nextPrayerTimeRemaining = '';

//                 if (index < prayerNames.length - 1) {
//                   // Calculate time remaining for the next prayer
//                   final nextPrayerName = prayerNames[index + 1];
//                   final nextPrayerTime =
//                       prayerData!.data.timings[nextPrayerName];
//                   var nextPrayerDateTime = DateTime(
//                       now.year,
//                       now.month,
//                       now.day,
//                       int.parse(nextPrayerTime.split(":")[0]),
//                       int.parse(nextPrayerTime.split(":")[1]));

//                   if (nextPrayerDateTime.isBefore(now)) {
//                     // If the next prayer time is earlier than the current time, add one day to it
//                     nextPrayerDateTime =
//                         nextPrayerDateTime.add(Duration(days: 1));
//                   }

//                   final nextPrayerDifference =
//                       nextPrayerDateTime.difference(now);
//                   final nextPrayerHours = nextPrayerDifference.inHours;
//                   final nextPrayerMinutes =
//                       (nextPrayerDifference.inMinutes % 60);
//                   nextPrayerTimeRemaining =
//                       'Time Remaining until ${prayerNameMap[nextPrayerName] ?? nextPrayerName}: ${nextPrayerHours}h ${nextPrayerMinutes}m';
//                 }

//                 return Column(
//                   children: [
//                     ListTile(
//                       title: Text('Prayer: $arabicPrayerName'),
//                       subtitle: Text(
//                         'Time Remaining: $hours h $minutes m',
//                       ),
//                     ),
//                     if (nextPrayerTimeRemaining.isNotEmpty)
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16.0),
//                         child: Text(
//                           nextPrayerTimeRemaining,
//                           style: TextStyle(
//                             fontStyle: FontStyle.italic,
//                             color: Colors.blue,
//                           ),
//                         ),
//                       ),
//                   ],
//                 );
//               },
//             ),
//     );
//   }
// }//end of class
//   Data? prayerData;
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     fetchPrayerData();
//     // Schedule a timer to update the container every minute
//     timer = Timer.periodic(Duration(minutes: 1), (timer) {
//       setState(() {}); // Trigger a rebuild to update the container
//     });
//   }

//   @override
//   void dispose() {
//     // Cancel the timer when the widget is disposed
//     timer?.cancel();
//     super.dispose();
//   }

//   Future<void> fetchPrayerData() async {
//     try {
//       prayerData = await PrayerService.getPrayerData();
//       setState(() {});
//     } catch (e) {
//       print('Error fetching prayer data: $e');
//     }
//   }

//   String getNextPrayerTimeRemaining() {
//     if (prayerData != null) {
//       final now = DateTime.now();
//       for (String prayerName
//           in prayerData!.data.timings.entries.map((e) => e.key)) {
//         final prayerTime = prayerData!.data.timings[prayerName];
//         final prayerDateTime = DateTime(
//           now.year,
//           now.month,
//           now.day,
//           int.parse(prayerTime.split(":")[0]),
//           int.parse(prayerTime.split(":")[1]),
//         );

//         if (prayerDateTime.isAfter(now)) {
//           final difference = prayerDateTime.difference(now);
//           final hours = difference.inHours;
//           final minutes = difference.inMinutes % 60;
//           return 'Time Remaining until $prayerName: $hours h $minutes m';
//         }
//       }
//     }
//     return 'No upcoming prayer';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Prayer Times'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.grey[200],
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Text(
//                 'Next Prayer Time Remaining',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 getNextPrayerTimeRemaining(),
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//   Data? prayerData;
//   Duration timeRemaining = Duration();
//   Timer? timer;
//   String nextPrayerName = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchPrayerData();
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future<void> fetchPrayerData() async {
//     try {
//       prayerData = await PrayerService.getPrayerData();
//       if (prayerData != null) {
//         updateNextPrayerTimeRemaining();
//         timer = Timer.periodic(Duration(seconds: 1), (timer) {
//           updateNextPrayerTimeRemaining();
//         });
//       }
//     } catch (e) {
//       print('Error fetching prayer data: $e');
//     }
//   }

//   void updateNextPrayerTimeRemaining() {
//     if (prayerData != null) {
//       final now = DateTime.now();
//       for (String prayerName in prayerData!.data.timings.entries.map((e) => e.key)) {
//         final prayerTime = prayerData!.data.timings[prayerName];
//         final prayerDateTime = DateTime(
//           now.year,
//           now.month,
//           now.day,
//           int.parse(prayerTime.split(":")[0]),
//           int.parse(prayerTime.split(":")[1]),
//         );

//         if (prayerDateTime.isAfter(now)) {
//           final difference = prayerDateTime.difference(now);
//           setState(() {
//             timeRemaining = difference;
//             nextPrayerName = prayerName;
//           });
//           return;
//         }
//       }
//     }
//     setState(() {
//       timeRemaining = Duration();
//       nextPrayerName = 'No upcoming prayer';
//     });
//   }

//   // String formatDuration(Duration duration) {
//   //   final hours = duration.inHours;
//   //   final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
//   //   final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
//   //   return '$hours:$minutes:$seconds';
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final hours = timeRemaining.inHours;
//     final minutes = (timeRemaining.inMinutes % 60);
//     final seconds = (timeRemaining.inSeconds % 60);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Prayer Times'),
//       ),
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.grey[200],
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             children: [
//               Text(
//                 'Next Prayer Time Remaining',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'Time Remaining until ${nextPrayerName}: $hours:$minutes:$seconds',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//##########################################################################
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PrayerTimeCubit>(create: (context) => PrayerTimeCubit()),
        BlocProvider<UpdatedPrayerTimeCubit>(
            create: (context) => UpdatedPrayerTimeCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: FutureBuilder<Data?>(
            future: PrayerService.getPrayerData(),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff859956),
                ),
                padding: const EdgeInsets.only(
                    left: 16, top: 16, bottom: 30, right: 16),
                child: BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
                  builder: (context, state) {
                    final hours = state.timeRemaining.inHours;
                    final minutes = (state.timeRemaining.inMinutes % 60);
                    final seconds = (state.timeRemaining.inSeconds % 60);

                    return Column(
                      children: [
                        Text(
                          state.prayerData?.data.meta.timezone.split("/")[1] ??
                              'N/A',
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
                              'صلاة ${state.nextPrayerName}',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                            Text(
                              '$hours:$minutes:$seconds',
                              style: const TextStyle(
                                  fontSize: 24, color: Colors.white),
                            ),
                          ],
                        ),
                        // Text(
                        //   'Time Remaining until ${state.nextPrayerName}: $hours:$minutes:$seconds',
                        //   style: const TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: FutureBuilder(
                    future: PrayerService.getPrayerData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While waiting for the future to complete, display a loading indicator.
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError || snapshot.data == null) {
                        // If an error occurs, display an error message.
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).fajr),
                                  Text(snapshot.data!.data.timings.fajr),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).dhuhr),
                                  Text(snapshot.data!.data.timings.dhuhr),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).asr),
                                  Text(snapshot.data!.data.timings.asr),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).maghrib),
                                  Text(snapshot.data!.data.timings.maghrib),
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(S.of(context).isha),
                                  Text(snapshot.data!.data.timings.isha),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        // Return a default widget or message when none of the conditions match.
                        return const Text('No data available.');
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Padding(
