import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/message.dart';

class NameProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<Message> messages = [
    Message(
      sender: vatsal,
      time: '5:30 PM',
      text: 'Yes!!',
    ),
    Message(
      sender: currentUser,
      time: '4:30 PM',
      text: 'Did you learn Data Structures and Algorithms as well?',
    ),
    Message(
      sender: vatsal,
      time: '3:45 PM',
      text: 'It is very interesting',
    ),
    Message(
      sender: vatsal,
      time: '3:15 PM',
      text: 'C++ programming',
    ),
    Message(
      sender: currentUser,
      time: '2:30 PM',
      text: 'Nice! Which one?',
    ),
    Message(
      sender: vatsal,
      time: '2:00 PM',
      text: 'I finally learned a programming language.',
    ),
  ];

  addMessage(Message newMessage) {
    messages.insert(0, newMessage);
    notifyListeners();
  }

  List<Message> get allmessage => messages;
}
