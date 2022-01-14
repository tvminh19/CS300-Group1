import 'dart:developer';
import 'package:paylo_chat/Widgets/my_appbar.dart';
import 'package:paylo_chat/services/constance.dart';
import 'package:paylo_chat/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'conversation.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethod databaseMethod = DatabaseMethod();
  TextEditingController searchTC = TextEditingController();
  QuerySnapshot? querySnapshot;
  initialSearch() {
    databaseMethod.getUserbyUsername(searchTC.text).then(
      (val) {
        setState(() {
          if (val != null) {
            querySnapshot = val;
          }
        });
      },
    );
  }

  Widget searchList() {
    if (querySnapshot != null) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: querySnapshot?.docs.length,
        itemBuilder: (context, index) {
          return searchTitle(
            userName: querySnapshot?.docs[index].get("name"),
            email: querySnapshot?.docs[index].get("email"),
          );
        },
      );
    } else {
      return Container();
    }
  }

  creatingChatroomAndStartConversation(String userName) {
    if (userName != Constance.myName) {
      if (Constance.myName.isEmpty){
        log(Constance.myName);
      }
      String chatroomid = getChatRoomId(userName, Constance.myName);
      List<String> users = [userName, Constance.myName];
      Map<String, dynamic> chatroomMap = {
        "users": users,
        "chatroomid": chatroomid
      };
      DatabaseMethod().createChatRoom(chatroomid, chatroomMap);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Conversation(chatroomID: chatroomid),
          ));
    } else {
      log("You can not message with yourself");
    }
  }

  @override
  void initState() {
    initialSearch();
    super.initState();
  }

  Widget searchTitle({required String userName, required String email}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        children: [
          Column(
            children: [Text(userName), Text(email)],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              creatingChatroomAndStartConversation(userName);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueAccent),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              child: const Text("Message"),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Search!"),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchTC,
                    decoration: const InputDecoration(
                      hintText: "Search username...",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    initialSearch();
                  },
                  child: const Icon(Icons.search),
                )
              ],
            ),
          ),
          searchList(),
        ],
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.compareTo(b) < 0) {
    return "${b}_$a";
  } else {
    return "${a}_$b";
  }
}
