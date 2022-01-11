import 'package:chat_app/Widgets/my_appbar.dart';
import 'package:chat_app/services/constance.dart';
import 'package:chat_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final String chatroomID;
  const Conversation({
    Key? key,
    required this.chatroomID,
  }) : super(key: key);

  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  DatabaseMethod databaseMethod = DatabaseMethod();
  TextEditingController messTC = TextEditingController();
  late Stream<QuerySnapshot> chatMessStream;

  Widget chatMessageList() {
    return StreamBuilder<QuerySnapshot>(
      stream: chatMessStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return MessTitle(
                  content: snapshot.data!.docs[index].get("message"),
                  isSendbyMe: snapshot.data!.docs[index].get("sendBy") ==
                      Constance.myName);
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  sendMessage() {
    if (messTC.text.isNotEmpty) {
      Map<String, dynamic> messMap = {
        "message": messTC.text,
        "sendBy": Constance.myName,
        "time": DateTime.now().millisecondsSinceEpoch,
      };
      databaseMethod.addConversationContent(widget.chatroomID, messMap);
      messTC.text = "";
    }
  }

  @override
  void initState() {
    setState(() {
      chatMessStream = databaseMethod.getConversationContent(widget.chatroomID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Conversation"),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Stack(
          children: [
            chatMessageList(),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messTC,
                      decoration: const InputDecoration(
                        hintText: "Aa...",
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      sendMessage();
                    },
                    child: const Icon(Icons.send_rounded),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessTitle extends StatelessWidget {
  final String content;
  final bool isSendbyMe;
  const MessTitle({
    Key? key,
    required this.content,
    required this.isSendbyMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSendbyMe ? Alignment.centerRight : Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSendbyMe ? Colors.blueAccent : Colors.grey,
          borderRadius: isSendbyMe
              ? const BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                  bottomLeft: Radius.circular(23))
              : const BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                  bottomRight: Radius.circular(23)),
        ),
        child: Text(content),
      ),
    );
  }
}
