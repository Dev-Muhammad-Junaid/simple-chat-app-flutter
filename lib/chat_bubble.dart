import 'package:flutter/material.dart';
import 'package:simple_chat_app/utils/spaces.dart';



class ChatBubble extends StatelessWidget {
   final Alignment alignment;
   final String message;
   ChatBubble({Key? key, required this.alignment,required this.message});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            verticalSpacing(10),
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
    );
  }
}
