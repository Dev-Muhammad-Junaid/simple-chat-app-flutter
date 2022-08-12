import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  final loginstyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 30);
  void _loginuser() {
    print("logged in");
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
              Text("Signup Now!️",style: loginstyle,textAlign: TextAlign.center,),
              Text("Welcome Back! \n We love you ❤️",style: loginstyle.copyWith(fontSize:20,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
              Image.network('https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',height: 200,),
              ElevatedButton(onPressed: _loginuser, child:Text("Elevated")),
              OutlinedButton(onPressed: (){}, child:FlutterLogo()),
              TextButton(onPressed: (){}, child:Text("All rights reserved")),
            ],
          ),
        ),
      ),
    );
  }
}
