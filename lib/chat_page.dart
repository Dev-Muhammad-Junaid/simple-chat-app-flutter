import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_bubble.dart';
import 'package:simple_chat_app/chat_message_entity.dart';
import 'package:simple_chat_app/login_page.dart';

import 'chat_input.dart';

class ChatPage extends StatelessWidget {
   ChatPage({Key? key}) : super(key: key);

  List<ChatMessageEntity> _messages=[
    ChatMessageEntity(id: '1234', text: 'Hi this is Junaid !', createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Junaid")),
    ChatMessageEntity(id: '2421', text: 'How you doing Lancer !',imageUrl:'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png' , createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Junaid")),
    ChatMessageEntity(id: '251', text: 'Hi Junaid !', createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Lancer"),)
  ];

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 1,
        title: Text(
          username,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context,'/login');
            },
            icon: Icon(Icons.login),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount:_messages.length,itemBuilder: (context,index){
              return ChatBubble(
                  alignment: _messages[index].author.username=='Junaid'?Alignment.centerLeft:Alignment.centerRight,
                  entity: _messages[index]);}),
          ),
          ChatInput()],
      ),
    );
  }
}



