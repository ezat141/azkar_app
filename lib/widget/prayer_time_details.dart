import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/UpdatedPrayerTimeCubit/updated_prayer_time_cubit.dart';
import '../cubit/UpdatedPrayerTimeCubit/updated_prayer_time_state.dart';
import '../generated/l10n.dart';
import '../models/prayer_model.dart';

class PrayerTimeDetails extends StatelessWidget {
  final Data prayerData;

  const PrayerTimeDetails(this.prayerData, {super.key});
  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).fajr),
              Text(prayerData.data.timings.fajr),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).dhuhr),
              Text(prayerData.data.timings.dhuhr),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).asr),
              Text(prayerData.data.timings.asr),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).maghrib),
              Text(prayerData.data.timings.maghrib),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.of(context).isha),
              Text(prayerData.data.timings.isha),
            ],
          ),
        ],
      ),
    );
  }
}
