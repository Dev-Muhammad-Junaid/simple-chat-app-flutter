import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_bubble.dart';
import 'package:simple_chat_app/chat_message_entity.dart';
import 'package:http/http.dart' as http;
import 'package:simple_chat_app/models/image_model.dart';

import 'chat_input.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
        id: '1234',
        text: 'Hi this is Junaid !',
        createdAt: DateTime
            .now()
            .microsecondsSinceEpoch,
        author: Author(username: "Junaid")),
    ChatMessageEntity(
        id: '2421',
        text: 'How you doing Lancer !',
        imageUrl:
        'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',
        createdAt: DateTime
            .now()
            .microsecondsSinceEpoch,
        author: Author(username: "Junaid")),
    ChatMessageEntity(
        id: '251',
        text: 'Hi Junaid !',
        createdAt: DateTime
            .now()
            .microsecondsSinceEpoch,
        author: Author(username: "Lancer")),
    ChatMessageEntity(
        id: '251',
        text: 'Hey! Whatsuppp !',
        createdAt: DateTime
            .now()
            .microsecondsSinceEpoch,
        author: Author(username: "Junaid")),
    ChatMessageEntity(
        id: '251',
        text: 'Check this !',
        createdAt: DateTime
            .now()
            .microsecondsSinceEpoch,
        author: Author(username: "Lancer"))
  ];

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  Future<List<PixelFordImage>> _getNetworkImages() async {
    var endpointURL = Uri.parse("https://pixelford.com/api2/images");
    final response = await http.get(endpointURL);
    if (response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;
      final List<PixelFordImage> _imageslist =
      decodedList.map((e) => PixelFordImage.fromJson(e)).toList();
      print(_imageslist[0].urlFullSize);
      return _imageslist;
    }
    else
      throw "API NOT WORKING";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute
        .of(context)!
        .settings
        .arguments as String;
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
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.login),
            color: Colors.black,
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<PixelFordImage>>(
            future: _getNetworkImages(),
              builder: (BuildContext context, AsyncSnapshot<List<PixelFordImage>> snapshot) {
                if(snapshot.hasData) return Image.network(snapshot.data![0].urlSmallSize);
                else return CircularProgressIndicator();
              }
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      alignment: _messages[index].author.username == 'Junaid'
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      entity: _messages[index]);
                }),
          ),
          ChatInput(
            onSubmit: onMessageSent,
          )
        ],
      ),
    );
  }
}
