import 'package:flutter/material.dart';
import 'package:bigBobble/models/message.dart';
import 'package:bigBobble/models/user.dart';
import 'package:string_validator/string_validator.dart';
import '../models/message.dart';
import 'package:provider/provider.dart';
import '../providers/messageProvider.dart';

class ChatScreen extends StatefulWidget {
  static const chatScreenRoute = 'ChatScreen';
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _formKey = GlobalKey<FormState>();
  var start;
  double value;
  TextEditingController messageController = TextEditingController();

  _buildMessage(Message message) {
    final Container msg = Container(
      margin: EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
        right: 10,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: Color(0xffdbfac6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: message.mesIze,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    return msg;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Color(0xff075E54),
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage(
                widget.user.imageUrl,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            widget.user.isTyping == true
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.user.name,
                      ),
                      Text(
                        'typing...',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 10,
                        ),
                      )
                    ],
                  )
                : Text(
                    widget.user.name,
                  ),
          ],
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            reverse: true,
            itemCount: context.watch<NameProvider>().allmessage.length,
            padding: EdgeInsets.only(bottom: 70),
            itemBuilder: (BuildContext context, int index) {
              final Message message =
                  context.watch<NameProvider>().allmessage[index];

              return _buildMessage(message);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                height: 70.0,
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.insert_emoticon),
                        iconSize: 25.0,
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (!isNull(value)) {
                              return null;
                            }
                            return 'Enter Message first';
                          },
                          textCapitalization: TextCapitalization.sentences,
                          controller: messageController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Send a message...',
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff075E54),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(2),
                        child: Tooltip(
                          height: 10,
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                          message: messageController.text,
                          child: GestureDetector(
                            onTap: () {
                              print('ontap');
                              if (_formKey.currentState.validate()) {
                                context.read<NameProvider>().addMessage(
                                      Message(
                                        sender: currentUser,
                                        time: '2:30 PM',
                                        text: messageController.text,
                                        mesIze: 12,
                                      ),
                                    );
                                messageController.clear();
                              }
                            },
                            onLongPressStart: (details) {
                              print('start');
                              start = DateTime.now();
                            },
                            onLongPressEnd: (details) {
                              print('end');
                              if (_formKey.currentState.validate()) {
                                final difference = DateTime.now()
                                    .difference(start)
                                    .inMilliseconds;
                                if (difference <= 100) {
                                  value = 12;
                                } else if (difference > 100 &&
                                    difference <= 300) {
                                  value = 15;
                                } else if (difference > 300 &&
                                    difference <= 500) {
                                  value = 18;
                                } else if (difference > 500 &&
                                    difference <= 600) {
                                  value = 21;
                                } else if (difference > 600 &&
                                    difference <= 800) {
                                  value = 24;
                                } else if (difference > 800 &&
                                    difference <= 900) {
                                  value = 26;
                                } else if (difference > 900 &&
                                    difference <= 1200) {
                                  value = 28;
                                } else {
                                  value = 30;
                                }
                                context.read<NameProvider>().addMessage(
                                      Message(
                                        sender: currentUser,
                                        time: '2:30 PM',
                                        text: messageController.text,
                                        mesIze: value,
                                      ),
                                    );
                                messageController.clear();
                              }
                            },
                            child: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              iconSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
