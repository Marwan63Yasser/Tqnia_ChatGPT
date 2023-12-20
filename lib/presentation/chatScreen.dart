
//import 'package:dash_chat_2/dash_chat_2.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tqnia_chatgpt/presentation/ChatBubble.dart';
import 'package:tqnia_chatgpt/constants/colors.dart';
import 'package:tqnia_chatgpt/presentation/chatMessage.dart';
//import 'package:tqnia_chatgpt/ApiCall.dart';
import 'package:tqnia_chatgpt/constants/strings.dart';
import 'package:http/http.dart' as http;


class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController messageController = TextEditingController();
  List<ChatMessage> chatMessages = [];

  Future sendMessage(String message,) async {
  final response =  await http.post(
    Uri.parse("https://api.openai.com/v1/completions"),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $openaiApiKey'
    },
    body: json.encode({
      "model": "gpt-3.5-turbo-instruct",
      "prompt": message,
      "max_tokens": 250,
      "temperature": 0,
    }));

    if(response.statusCode == 200)
    {
      final jsonResponse = json.decode(response.body);
      setState(() {
        chatMessages.removeLast();
        chatMessages.add(ChatMessage(text: jsonResponse['choices'][0]['text'], isUser: false));
        messageController.clear();
      });
    }
    else{
      showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.appGrey,
                          title: Text("Request Failed With Status: ${response.statusCode}",style: const TextStyle(color: AppColors.appWhite),),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.appGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                  ),
                                  child: const Text("Okay",
                                      style: TextStyle(color: AppColors.appWhite))),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        );
                      });
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGrey,
      appBar: AppBar(
        leadingWidth: 5,
        leading: Container(),
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios)),
            const SizedBox(width: 2,),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back')),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset('assets/images/ChatGptIcon.png',height: 25,width: 25,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
          //reverse: true,
          itemCount: chatMessages.length,
          itemBuilder:(context, index) {
            return chatMessages.isEmpty ? const Center(child: Text("Ask anything, get yout answer",style: TextStyle(color: AppColors.appWGrey),),)
            : SingleChildScrollView(
              child: Column(
                children: [
                  UserChatBubble(message: chatMessages[index]),
                  chatMessages.length - 1 == index
                      ? SizedBox(
                          height: (100 / 772) *
                              MediaQuery.of(context).size.height, //85,
                        )
                      : Container(),
                ],
              ),
            );
          },)
        ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(left: 35),
        child: TextField(
          controller: messageController,
          style: const TextStyle(color: AppColors.appWhite),
          decoration: InputDecoration(
              
              filled: true,
              fillColor: const Color.fromARGB(255, 102, 103, 117),
              
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  
              border: const OutlineInputBorder(
                
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 8,top: 3,bottom: 3),
                child: InkWell(
                  onTap: () {
                    if(messageController.text.isNotEmpty)
                    {
                      setState(() {
                        chatMessages.add(ChatMessage(text: messageController.text, isUser: true));
                        chatMessages.add(ChatMessage(text: "Loading.....", isUser: false));
                      });
                      sendMessage(messageController.text);
                      messageController.clear();
                    }
                    else{
                      showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.appGrey,
                          title: const Text("You Don't Write Anything!!!",style: TextStyle(color: AppColors.appWhite,fontSize: 16),),
                          actions: [
                            Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.appGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8)),
                                  ),
                                  child: const Text("Okay",
                                      style: TextStyle(color: AppColors.appWhite))),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        );
                      });
                    }
                    
                  },
                  child: Container(height: 5,width: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.appGreen,
                  ),
                  child: Center(child: Image.asset("assets/images/SendIcon.png"),),
                  ),
                ),
              )
              ),
              maxLines: 1,
          ),
        ),
    );
  }
}