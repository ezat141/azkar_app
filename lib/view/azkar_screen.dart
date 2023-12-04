import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/AzkarScreenCubit/azkar_screen_cubit.dart';
import '../models/azkar_azkar.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key, required this.adhkarData, required this.categoryName}) : super(key: key);

  final List<Cont> adhkarData;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AzkarScreenCubit(adhkarData),
      child: _AzkarScreenContent(categoryName: categoryName),
    );
  }
}

class _AzkarScreenContent extends StatelessWidget {
  const _AzkarScreenContent({Key? key, required this.categoryName}) : super(key: key);

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body: BlocBuilder<AzkarScreenCubit, List<Cont>>(
        builder: (context, visibleAdhkarData) {
          return ListView.builder(
            itemCount: visibleAdhkarData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<AzkarScreenCubit>().decrementRepeatCount(index);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Repeat count decremented'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Card(
                  color: const Color(0xff859956),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: const EdgeInsets.all(8),
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(visibleAdhkarData[index].text),
                    subtitle: Text('Repeat: ${visibleAdhkarData[index].count.toString()}'),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
