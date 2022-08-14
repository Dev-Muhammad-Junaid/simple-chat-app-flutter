import 'package:flutter/material.dart';
import 'package:simple_chat_app/chat_message_entity.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({Key? key,required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final ChatEditingController = TextEditingController();

  void onSendButtonPressed()
  {
    final newChatMessage = ChatMessageEntity(text: ChatEditingController.text, createdAt: DateTime.now().microsecondsSinceEpoch, id: '2001', author: Author(username: "Junaid"));
    ChatEditingController.text='';
    widget.onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              minLines: 1,
              controller: ChatEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Type your Messsage"
              ),
            ),
          ),
          IconButton(
              onPressed: onSendButtonPressed, icon: Icon(Icons.send), color: Colors.black),
        ],
      ),
      decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(0, 8),)]),
    );
  }
}
