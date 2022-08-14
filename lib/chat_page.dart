import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_bubble.dart';
import 'package:simple_chat_app/chat_message_entity.dart';
import 'package:http/http.dart' as http;

import 'chat_input.dart';

class ChatPage extends StatefulWidget {
  
   ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<ChatMessageEntity> _messages =[
      ChatMessageEntity(id: '1234', text: 'Hi this is Junaid !', createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Junaid")),
      ChatMessageEntity(id: '2421', text: 'How you doing Lancer !',imageUrl:'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png' , createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Junaid")),
      ChatMessageEntity(id: '251', text: 'Hi Junaid !', createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Lancer")),
      ChatMessageEntity(id: '251', text: 'Hey! Whatsuppp !', createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Junaid")),
      ChatMessageEntity(id: '251', text: 'Check this !', createdAt: DateTime.now().microsecondsSinceEpoch, author: Author(username: "Lancer"))
    ];


   onMessageSent(ChatMessageEntity entity)
  {
    _messages.add(entity);
    setState((){});
  }
  _getNetworkImages() async
  {
    var endpointURL = Uri.parse("https://pixelford.com/api2/images");
    final response = await http.get(endpointURL);
    print(response.body);

  }
  @override
  void initState() {
    _getNetworkImages();
    // TODO: implement initState
    super.initState();
  }
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
          ChatInput(onSubmit: onMessageSent,)],
      ),
    );
  }
}



