
import 'package:flutter/material.dart';
import 'package:tqnia_chatgpt/constants/colors.dart';
import 'package:tqnia_chatgpt/presentation/welcomeScrP1.dart';
import 'package:tqnia_chatgpt/presentation/welcomeScrP2.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: AppColors.appGrey,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Welcometitle(),
              SizedBox(height: 60,),
              WelcomeTexts(),
            ],
          ),
      ),
    );
  }
}