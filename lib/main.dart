import 'package:flutter/material.dart';

import 'chat_page.dart';
import 'login_page.dart';

void main() {
  runApp(ChatApp());
}


class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor:Colors.transparent,primarySwatch: Colors.deepPurple,appBarTheme: AppBarTheme(color: Colors.grey,foregroundColor: Colors.black)),
      initialRoute: '/login',
    routes: {
        '/login': (context) => LoginPage(),
        '/chat' : (context) => ChatPage(),
    },);
  }
}

