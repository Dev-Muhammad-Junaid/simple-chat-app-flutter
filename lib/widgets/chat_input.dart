import 'package:flutter/material.dart';
import 'package:simple_chat_app/models/chat_message_entity.dart';
import 'package:simple_chat_app/widgets/image_picker.dart';

class ChatInput extends StatefulWidget {
  String _selectedimageurl = '';

  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final ChatEditingController = TextEditingController();

  void onSendButtonPressed() {
    final newChatMessage = ChatMessageEntity(
        text: ChatEditingController.text,
        createdAt: DateTime.now().microsecondsSinceEpoch,
        id: '2001',
        author: Author(username: "Junaid"));
    widget.onSubmit(newChatMessage);
    ChatEditingController.clear();
    //Check if selectedimage is empty or not
    if ( widget._selectedimageurl.isNotEmpty) {
      newChatMessage.imageUrl =  widget._selectedimageurl;
    }
    widget._selectedimageurl = '';
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      print("I received :" + newImageUrl);
      widget._selectedimageurl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePicker(onImageSelected: onImagePicked);
                  });
            },
            icon: Icon(Icons.add),
            color: Colors.black,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  textCapitalization: TextCapitalization.sentences,
                  minLines: 1,
                  controller: ChatEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Type your Messsage"),
                ),
                if ( widget._selectedimageurl.isNotEmpty)
                  Image.network(
                    widget._selectedimageurl,
                  ),
              ],
            ),
          ),
          IconButton(
              onPressed: onSendButtonPressed,
              icon: Icon(Icons.send),
              color: Colors.black),
        ],
      ),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 5,
          blurRadius: 10,
          offset: Offset(0, 8),
        )
      ]),
    );
  }
}
