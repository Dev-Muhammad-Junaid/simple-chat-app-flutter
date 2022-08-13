import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_bubble.dart';
import 'package:simple_chat_app/login_page.dart';

import 'chat_input.dart';

class ChatPage extends StatefulWidget {
  final String username;
  const ChatPage({Key? key,required this.username}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 1,
        title: Text(
          widget.username,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              print("Button Pressed");
            },
            icon: Icon(Icons.login),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount:10,itemBuilder: (context,index){
              return ChatBubble(
                  alignment: index%2==0?Alignment.centerLeft : Alignment.centerRight,
                  message: "This is the first Message");}),
          ),
          ChatInput()],
      ),
    );
  }
}
