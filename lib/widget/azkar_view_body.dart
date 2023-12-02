import 'package:azkar_app/widget/azkar_list_view.dart';
import 'package:flutter/material.dart';

class AzkarViewBody extends StatelessWidget {
  const AzkarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: AzkarListView()),

        ],
      ),
      );
  }
}