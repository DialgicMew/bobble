import 'package:flutter/material.dart';
import 'package:bigBobble/models/message.dart';
import 'package:bigBobble/screens/chat.dart';

class ChatBlock extends StatelessWidget {
  final Message chat;
  ChatBlock({@required this.chat});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ChatScreen.chatScreenRoute, arguments: chat.sender);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(
            color: Colors.grey[300],
            width: 0.4,
          )),
          color: Colors.white,
        ),
        child: ListTile(
          leading: AspectRatio(
            aspectRatio: 1,
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: AssetImage(
                chat.sender.imageUrl,
              ),
            ),
          ),
          title: Text(
            chat.sender.name,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                chat.time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: "arial",
                ),
              ),
              SizedBox(height: 5.0),
            ],
          ),
          subtitle: Text(
            chat.sender.isTyping == true ? 'typing...' : chat.text,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
