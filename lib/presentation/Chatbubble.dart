import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:tqnia_chatgpt/constants/colors.dart';
import 'package:tqnia_chatgpt/presentation/chatMessage.dart';

class UserChatBubble extends StatelessWidget {
  final ChatMessage message;
  const UserChatBubble({super.key,required this.message});

  @override
  Widget build(BuildContext context) {
    return message.isUser ? ChatBubble(
        clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 20),
        backGroundColor: AppColors.appGreen,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(message.text,
            style: const TextStyle(color: AppColors.appWhite),
          ),
        ),
      )
      : ChatBubble(
    clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
    backGroundColor: const Color.fromARGB(11, 255, 255, 255),
    margin: const EdgeInsets.only(top: 20),
    child: Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      child: Text(message.text.trim(),
        style: const TextStyle(color: AppColors.appWhite),
      ),
    ),
  );
  }
}