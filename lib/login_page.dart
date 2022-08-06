import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () { print("Button Clicked"); },),
      //TODO: Add the text and button from the design
    );
  }
}
