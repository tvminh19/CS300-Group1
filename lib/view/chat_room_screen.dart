import 'package:paylo_chat/services/auth.dart';
import 'package:paylo_chat/services/constance.dart';
import 'package:paylo_chat/services/database.dart';
import 'package:paylo_chat/view/search_screen.dart';
import 'package:paylo_chat/view/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'conversation.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  AuthMethods authMethods = AuthMethods();
  DatabaseMethod databaseMethod = DatabaseMethod();
  late Stream<QuerySnapshot> chatRoomStream;

  Widget chatMessageList() {
    return StreamBuilder<QuerySnapshot>(
      stream: chatRoomStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ChatroomTitle(
                    userName: snapshot.data!.docs[index]
                        .get("chatroomid")
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constance.myName, ""),
                    chatroomid: snapshot.data!.docs[index].get("chatroomid"),
                  );
                },
              )
            : Container();
      },
    );
  }

  @override
  void initState() {
    setState(() {
      chatRoomStream = databaseMethod.getChatRoom(Constance.myName);
    });
    super.initState();
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
              Constance.isLoggedIn = false;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      body: chatMessageList(),
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

class ChatroomTitle extends StatelessWidget {
  final String userName;
  final String chatroomid;
  const ChatroomTitle(
      {Key? key, required this.userName, required this.chatroomid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Conversation(
              chatroomID: chatroomid,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Text(
              userName.substring(0, 1).toUpperCase(),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(userName)
        ]),
      ),
    );
  }
}
