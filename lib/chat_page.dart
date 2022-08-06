import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(
          "Hi,Junaid",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
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

            child: ListView(children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("This is the first Message"),
                          SizedBox(
                            height: 10,
                          ),
                          Image.network(
                            'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',
                            height: 200,
                          )
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("This is the first Message"),
                          SizedBox(
                            height: 10,
                          ),
                          Image.network(
                            'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',
                            height: 200,
                          )
                        ],
                      ),
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("This is the first Message"),
                        SizedBox(
                          height: 10,
                        ),
                        Image.network(
                          'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',
                          height: 200,
                        )
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ],
              ),
            ]),
          ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.black,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send),
                          color: Colors.black),
                    ],
                  ),
                  decoration: BoxDecoration(color: Colors.grey[600]),
                )
        ],
      ),
    );
  }
}
