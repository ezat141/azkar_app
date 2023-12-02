import 'package:flutter/material.dart';
import 'package:azkar_app/models/azkar_model.dart';
import 'package:azkar_app/services/azkar_service.dart';

import '../models/azker_content_model.dart';
import '../models/azkar_type.dart';
import '../models/azkar_azkar.dart';

// class AzkarScreen extends StatefulWidget {
//   @override
//   _AzkarScreenState createState() => _AzkarScreenState();
// }

// class _AzkarScreenState extends State<AzkarScreen> {
//   final AzkarService azkarService = AzkarService();
//   late Data azkarData = Data(title: "", content: []);

//   _AzkarScreenState(this.azkarType);

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final data = await azkarService.fetchAzkarData();
//       setState(() {
//         azkarData = data;
//       });
//     } catch (error) {
//       // Handle the error
//       print('Error: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Morning Azkar'),
//       ),
//       body: azkarData == null
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: ListView.builder(
//                 itemCount: azkarData.content.length,
//                 itemBuilder: (context, index) {
//                   final azkar = azkarData.content[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white,
//                         // boxShadow: [
//                         //   BoxShadow(
//                         //     color: Colors.grey.withOpacity(0.5),
//                         //     spreadRadius: 3,
//                         //     blurRadius: 3,
//                         //     offset: const Offset(0, 2),
//                         //   ),
//                         // ],
//                       ),
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Zekr: ${azkar.zekr}',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             'Repeat: ${azkar.repeat}',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                           Text(
//                             'Bless: ${azkar.bless}',
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//           ),
//     );
//   }
// }

//###################################################################################
// class AzkarScreen extends StatelessWidget {
//   AzkarScreen({super.key, required this.azkarType});

//   final AzkarService azkarService = AzkarService();
//   late Data azkarData = Data(title: "", content: []);
//   final AzkarType azkarType;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Morning Azkar'),
//       ),
//       body: FutureBuilder<Data>(
//         future: (azkarType == AzkarType.Morning)
//             ? azkarService.fetchMorningAzkarData()
//             : azkarService.fetchEveningAzkarData(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final List<Content> azkarContent = snapshot.data!.content;

//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListView.builder(
//                 itemCount: azkarContent.length,
//                 itemBuilder: (context, index) {
//                   return Card(
//                     color: const Color(0xff859956),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           16.0), // Customize the border radius
//                       // side: BorderSide(
//                       //   color: Colors.blue, // Customize the border color
//                       //   width: 2.0, // Customize the border width
//                       // ),
//                     ),
//                     margin: EdgeInsets.all(8),
//                     elevation: 4.0,
//                     child: ListTile(
//                       title: Text(azkarContent[index].zekr),
//                       subtitle: Text('Repeat: ${azkarContent[index].repeat}'),
//                     ),
//                   );
//                 },
//               ),
//             );
//           } else {
//             return const Center(child: Text('No data available'));
//           }
//         },
//       ),
//     );
//   }
// }
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({super.key, required this.adhkarData, required this.categoryName});
  final List<Cont> adhkarData;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(categoryName)),
      body: ListView.builder(
          itemCount: adhkarData.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color(0xff859956),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(16.0), // Customize the border radius
                // side: BorderSide(
                //   color: Colors.blue, // Customize the border color
                //   width: 2.0, // Customize the border width
                // ),
              ),
              margin: const EdgeInsets.all(8),
              elevation: 4.0,
              child: ListTile(
                title: Text(adhkarData[index].text),
                subtitle: Text('Repeat: ${adhkarData[index].count.toString()}'),
              ),
            );
          }),
    );
  }
}
