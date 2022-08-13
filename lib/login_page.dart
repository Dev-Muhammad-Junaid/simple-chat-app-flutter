

import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_page.dart';

class LoginPage extends StatelessWidget {
  final loginstyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void _loginuser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(usernamecontroller.text);
      print(passwordcontroller.text);
      print("logged in successfully");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => (ChatPage(username: usernamecontroller.text,))));
    } else {
      print("Failed to login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Signup Now!️",
                style: loginstyle,
                textAlign: TextAlign.center,
              ),
              Text(
                "Welcome Back! \n We love you ❤️",
                style: loginstyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              Image.network(
                'https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',
                height: 200,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernamecontroller,
                      validator: (value) {
                        if (value != null &&
                            value.length < 5 &&
                            value.isNotEmpty) {
                          return "Your Username should have atleast 5 characters";
                        }
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'Username'),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value != null &&
                            value.length < 5 &&
                            value.isNotEmpty) {
                          return "Your Password should have atleast 5 characters";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'password'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                _loginuser(context);
              }, child: Text("Login Now")),
              OutlinedButton(
                  onPressed: () {},
                  child: FlutterLogo(
                    size: 25,
                  )),
              TextButton(onPressed: () {}, child: Text("All Rights Reserved")),
            ],
          ),
        ),
      ),
    );
  }
}
