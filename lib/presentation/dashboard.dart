import 'package:flutter/material.dart';
import 'package:tqnia_chatgpt/constants/colors.dart';
import 'chatScreen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGrey,
      body: Column(
          
          
          children: [
            const SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              InkWell(
                onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ChatPage()));
                },
                child: const ListTile(
                  leading: Icon(Icons.comment,color: Colors.white,),
                  title: Text("New Chat",style: TextStyle(color: AppColors.appWhite,fontSize: 16),),
                  trailing: Icon(Icons.arrow_right_sharp,color: AppColors.appWhite,),
                ),
              ),
            ],),
            const SizedBox(height: 350,),
            const Divider(color: Color.fromARGB(160, 255, 255, 255), thickness: 0.7,),
            Column(children: [
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.delete,color: Colors.white,),
                  title: Text("Clear Conversation",style: TextStyle(color: AppColors.appWhite,fontSize: 16),),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.person,color: Colors.white,),
                  title: Text("Upgrade to Plus",style: TextStyle(color: AppColors.appWhite,fontSize: 16),),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.light_mode,color: Colors.white,),
                  title: Text("Light Mode",style: TextStyle(color: AppColors.appWhite,fontSize: 16),),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.info,color: Colors.white,),
                  title: Text("Updates & FAQ",style: TextStyle(color: AppColors.appWhite,fontSize: 16),),
                ),
              ),
              InkWell(
                onTap: () {},
                child: const ListTile(
                  leading: Icon(Icons.logout_outlined,color: Colors.red,),
                  title: Text("Log Out",style: TextStyle(color: Colors.red,fontSize: 16),),
                ),
              ),
            ],)
          ],
        ),
    );
  }
}