import 'package:chat_app/Widgets/my_appbar.dart';
import 'package:chat_app/services/constance.dart';
import 'package:chat_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Conversation extends StatefulWidget {
  final String classroomID;
  const Conversation({
    Key? key,
    required this.classroomID,
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
              return messTitle(
                  content: snapshot.data!.docs[index].get("message"));
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
      Map<String, String> messMap = {
        "message": messTC.text,
        "sendBy": Constance.myName,
      };
      databaseMethod.addConversationContent(widget.classroomID, messMap);
      messTC.text = "";
    }
  }

  @override
  void initState() {
    setState(() {
      chatMessStream =
          databaseMethod.getConversationContent(widget.classroomID);
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

Widget messTitle({required String content}) {
  return Text(content);
}
