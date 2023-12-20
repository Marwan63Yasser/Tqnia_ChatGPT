
import 'package:flutter/material.dart';
import 'package:tqnia_chatgpt/constants/colors.dart';
import 'package:tqnia_chatgpt/constants/strings.dart';
import 'package:tqnia_chatgpt/presentation/dashboard.dart';


class WelcomeTexts extends StatefulWidget {
  const WelcomeTexts({super.key});

  @override
  State<WelcomeTexts> createState() => _WelcomeTextsState();
}

class _WelcomeTextsState extends State<WelcomeTexts> {
    
    int counter = 1;
    String img1 = wel1img1;
    String title = wel1title;
    String text1 = wel1text1;
    String text2 = wel1text2;
    String text3 = wel1text3;
    String img2 = wel1img2;
    String btntext = btntext1_2;

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                Image.asset(img1),
                const SizedBox(height: 10,),
                Text(title,style: const TextStyle(color: AppColors.appWhite,fontSize: 16,),),
                const SizedBox(height: 25,),
                Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    color: AppColors.appWGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(text1,style: const TextStyle(color: AppColors.appWhite),textAlign: TextAlign.center,),
                    ),
                  )
                ),
                const SizedBox(height: 15,),
                Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    color: AppColors.appWGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:   Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(text2,style: const TextStyle(color: AppColors.appWhite),textAlign: TextAlign.center,),
                    ),
                  )
                ),
                const SizedBox(height: 15,),
                Container(
                  height: 60,
                  width: 330,
                  decoration: BoxDecoration(
                    color: AppColors.appWGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(text3,style: const TextStyle(color: AppColors.appWhite),textAlign: TextAlign.center,),
                    ),
                  )
                ),

                const SizedBox(height: 60,),
                Image.asset(img2),
                const SizedBox(height: 15,),
                InkWell(
                  onTap: () {
                    setState(() {
                    if (counter == 1)
                    {
                      img1 = wel2img1;
                      title = wel2title;
                      text1 = wel2text1;
                      text2 = wel2text2;
                      text3 = wel2text3;
                      img2 = wel2img2;
                      counter++;
                    }
                    else if(counter == 2)
                    {
                      img1 = wel3img1;
                      title = wel3title;
                      text1 = wel3text1;
                      text2 = wel3text2;
                      text3 = wel3text3;
                      img2 = wel3img2;
                      btntext = btntext3;
                      counter++;
                    }
                    else{
                      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DashBoard()));
                    }
                  });
                  },
                  child: Container(
                    height: 60,
                    width: 330,
                    decoration: BoxDecoration(
                      color:  AppColors.appGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Center(child: Text(btntext,style: const TextStyle(color: AppColors.appWhite,fontSize: 18,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ],);
  }
}