import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 90, right: 0, left: 0, bottom: 0),
      child: Text('Chat'),
    );
  }
}
