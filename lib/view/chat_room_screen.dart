import 'dart:developer';

import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/constance.dart';
import 'package:chat_app/services/helper_function.dart';
import 'package:chat_app/view/search_screen.dart';
import 'package:chat_app/view/signin.dart';
import 'package:flutter/material.dart';


class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  AuthMethods authMethods = AuthMethods();
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }
  getUserInfo() async{
    await HelperFunction.getUserName().then((value) {
      if (value != null){
        Constance.myName = value;
      } else{
        log("GetUserInfo -> Constance.myName is null");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Room"),
        actions: [
          GestureDetector(
            onTap: () {
              authMethods.signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchScreen(),
              ));
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
