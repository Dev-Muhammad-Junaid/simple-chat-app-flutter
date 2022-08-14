import 'package:flutter/material.dart';
import 'package:simple_chat_app/utils/spaces.dart';

import '../models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  final ChatMessageEntity entity;

  ChatBubble({Key? key, required this.alignment, required this.entity});

  @override
  Widget build(BuildContext context) {
    bool isAuthor = entity.author.username == 'Junaid';
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.5,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(entity.text),
            verticalSpacing(10),
            if (entity.imageUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,

                      )
                    ],
                    image:
                        DecorationImage(image: NetworkImage(entity.imageUrl!)),
                    borderRadius: BorderRadius.circular(10)),
              ),
          ],
        ),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
            color: isAuthor ? Colors.greenAccent : Colors.blueAccent,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
