import 'package:flutter/material.dart';
import 'package:simple_chat_app/utils/spaces.dart';

import 'chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
   final Alignment alignment;
   final ChatMessageEntity entity;
   ChatBubble({Key? key, required this.alignment,required this.entity});


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entity.text),
            verticalSpacing(10),
            if(entity.imageUrl!=null)
              Image.network('${entity.imageUrl}', height: 200,),
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
