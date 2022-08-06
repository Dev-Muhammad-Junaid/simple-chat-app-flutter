import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  final loginstyle = TextStyle(fontWeight: FontWeight.bold,fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { print("Button Clicked"); },),
      //TODO: Add the text and button from the design
      body: Column(
        children: [
          Text("Signup Now!️",style: loginstyle,),
          Text("Welcome Back! \n We love you ❤️",style: loginstyle.copyWith(fontSize:20,fontWeight: FontWeight.w300),),
          Image.network('https://www.kindpng.com/picc/m/62-622207_super-man-png-transparent-superman-png-png-download.png',height: 300,),
          Container(
            height: 50,width: 50,
            child: FlutterLogo(),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
