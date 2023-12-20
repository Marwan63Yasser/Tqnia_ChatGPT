import 'package:flutter/material.dart';
import 'package:tqnia_chatgpt/constants/colors.dart';


class Welcometitle extends StatelessWidget {
  const Welcometitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                Image.asset('assets/images/ChatGptIcon.png',height: 25,width: 25,),
                const SizedBox(height: 20,),
                const Text("Welcome to\n   ChatGPT",style: TextStyle(color: AppColors.appWhite,fontSize: 28,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text('Ask anything, get yout answer',style: TextStyle(color: AppColors.appWhite,fontSize: 14,),)
              ],);
  }
}