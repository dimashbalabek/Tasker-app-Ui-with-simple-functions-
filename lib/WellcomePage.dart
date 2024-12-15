import 'package:dimash_balabek_lvl4/SignInPage.dart';
import 'package:flutter/material.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), (){Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){ return SignInPage();}));});
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network("assets/Logo.png"),
      ),
    );
  }
}