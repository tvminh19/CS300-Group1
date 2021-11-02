import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:paylo_chat/pages/add_friend/add_friend.dart';
import 'package:paylo_chat/pages/personal/personal.dart';

import 'chat/chat.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Personal _personal = const Personal();
  final AddFriend _addFriend = const AddFriend();
  final Chat _chat = const Chat();

  Widget _showPage = const Chat();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _chat;
      case 1:
        return _addFriend;
      case 2:
        return _personal;
      default:
        return const Center(child: Text('No Page Found'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paylo! Chat'),
      ),
      backgroundColor: Colors.white,
      body: _showPage,
      bottomNavigationBar: CurvedNavigationBar(
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.home, size: 30)
        ],
        backgroundColor: Colors.blueAccent,
        height: 50,
        onTap: (index) {
          setState(() {
            _showPage = _pageChooser(index);
          });
        },
      ),
    );
  }
}
