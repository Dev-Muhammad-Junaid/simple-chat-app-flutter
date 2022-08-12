import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({Key? key}) : super(key: key);
  final ChatEditingController = TextEditingController();
  void onSendButtonPressed()
  {
    print("Message : "+ChatEditingController.text);
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
