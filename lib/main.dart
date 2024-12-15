import 'package:dimash_balabek_lvl4/CommentPage.dart';
import 'package:dimash_balabek_lvl4/HomePage.dart';
import 'package:dimash_balabek_lvl4/TaskerProfile.dart';
import 'package:dimash_balabek_lvl4/WellcomePage.dart';
import 'package:dimash_balabek_lvl4/booking.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WellcomePage(),
    );
  }
}