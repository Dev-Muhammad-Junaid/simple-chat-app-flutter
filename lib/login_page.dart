import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  final loginstyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Signup Now!️",style: loginstyle,),
            Text("Welcome Back! \n We love you ❤️",style: loginstyle.copyWith(fontSize:20,fontWeight: FontWeight.w300),textAlign: TextAlign.center,),
            Image.network('https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',height: 200,),
          ],
        ),
      ),
    );
  }
}
