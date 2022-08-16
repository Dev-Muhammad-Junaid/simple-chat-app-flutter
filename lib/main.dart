import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'chat_page.dart';
import 'login_page.dart';
import 'models/auth_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(ChangeNotifierProvider(create: (BuildContext context) { return AuthService();  },
  child: ChatApp()));
}


class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(canvasColor:Colors.transparent,primarySwatch: Colors.deepPurple,appBarTheme: AppBarTheme(color: Colors.grey,foregroundColor: Colors.black)),
      home: FutureBuilder<bool>(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.connectionState == ConnectionState.done)
            {
              if(snapshot.hasData && snapshot.data!)
                return ChatPage();
            } else
              return  CircularProgressIndicator();
          return LoginPage();
        }
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/chat' : (context) => ChatPage(),
    },);
  }
}

