
import 'package:simple_chat_app/login_text_field.dart';
import 'package:simple_chat_app/utils/spaces.dart';
import 'package:simple_chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_page.dart';

class LoginPage extends StatelessWidget {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void _loginuser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(usernamecontroller.text);
      print(passwordcontroller.text);
      print("logged in successfully");
      Navigator.pushReplacementNamed(context, '/chat',arguments: '${usernamecontroller.text}');
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
                style: ThemeTextStyle.loginstyle,
                textAlign: TextAlign.center,
              ),
              Text(
                "Welcome Back! \n We love you ❤️",
                style: ThemeTextStyle.loginstyle.copyWith(
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
                    LoginTextField(
                      controller: usernamecontroller, hintText: "Enter your user name",
                      validator: (value) {
                        if (value != null &&
                            value.length < 5 &&
                            value.isNotEmpty) {
                          return "Your Username should have atleast 5 characters";
                        }
                      },
                    ),
                    verticalSpacing(15),
                    LoginTextField(
                      needAsteriks: true,
                      hintText: "Password",
                      controller: passwordcontroller,
                      validator: (value) {
                        if (value != null &&
                            value.length < 5 &&
                            value.isNotEmpty) {
                          return "Your Password should have atleast 5 characters";
                        }
                      },
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
