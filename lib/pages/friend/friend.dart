import 'package:flutter/material.dart';

class Friend extends StatefulWidget {
  const Friend({ Key? key }) : super(key: key);

  @override
  _FriendState createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Friend'),
    );
  }
}