import 'package:bigBobble/models/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final double mesIze;

  Message({
    this.sender,
    this.time,
    this.text,
    this.mesIze = 15,
  });
}

// current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/greg.jpg',
);

// USERS
final User greg = User(
  id: 1,
  name: 'Greg',
  imageUrl: 'assets/images/greg.jpg',
  isTyping: false,
);
final User vatsal = User(
  id: 2,
  name: 'Vatsal',
  imageUrl: 'assets/images/james.jpg',
  isTyping: true,
);
final User roy = User(
  id: 3,
  name: 'Roy',
  imageUrl: 'assets/images/john.jpg',
  isTyping: false,
);
final User sundar = User(
  id: 4,
  name: 'Sundar Pichai',
  imageUrl: 'assets/images/sundar.jpg',
  isTyping: false,
);
final User mukesh = User(
  id: 5,
  name: 'Mukesh Ambani',
  imageUrl: 'assets/images/mukesh.jpg',
  isTyping: false,
);
final User sophia = User(
  id: 6,
  name: 'Sophia',
  imageUrl: 'assets/images/sophia.jpg',
  isTyping: false,
);
final User bill = User(
  id: 7,
  name: 'Bill Gates',
  imageUrl: 'assets/images/bill.jpg',
  isTyping: false,
);

List<Message> chats = [
  Message(
    sender: vatsal,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
  ),
];
