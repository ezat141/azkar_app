import 'package:azkar_app/generated/l10n.dart';
import 'package:azkar_app/widget/azkar_item.dart';
import 'package:azkar_app/widget/azkar_view_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:  Text(
          S.of(context).azkar, 
          style: const TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold, 
            color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        
      ),
      
      body: const AzkarViewBody(),
      );
  }
}