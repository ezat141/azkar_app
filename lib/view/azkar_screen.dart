import 'package:flutter/material.dart';

import '../models/azkar_azkar.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key, required this.adhkarData, required this.categoryName}) : super(key: key);

  final List<Cont> adhkarData;
  final String categoryName;

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  late List<Cont> visibleAdhkarData;

  @override
  void initState() {
    super.initState();
    updateVisibleAdhkarData();
  }

  void updateVisibleAdhkarData() {
    visibleAdhkarData = widget.adhkarData.where((adhkar) => adhkar.count > 0).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName)),
      body: ListView.builder(
        itemCount: visibleAdhkarData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (visibleAdhkarData[index].count > 0) {
                setState(() {
                  visibleAdhkarData[index].count--;

                  // Update the visible list to remove items with count 0
                  updateVisibleAdhkarData();
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Repeat count decremented'),
                    duration: Duration(seconds: 1),
                  ),
                );
              }
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
      ),
    );
  }
}
