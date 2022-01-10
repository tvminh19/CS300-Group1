import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  getUserbyUsername(String username) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .where("name", isEqualTo: username)
        .get();
  }

  Future<QuerySnapshot<Object?>> getUserbyEmail(String email) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .where("email", isEqualTo: email)
        .get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection("user").add(userMap);
  }

  createChatRoom(String chatroomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("chat_room")
        .doc(chatroomId)
        .set(chatRoomMap)
        .catchError((e) {
      log(e.toString());
    });
  }

  addConversationContent(String chatroomId, messageMap) {
    FirebaseFirestore.instance
        .collection("chat_room")
        .doc(chatroomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      log(e.toString());
    });
  }

  getConversationContent(String chatroomId) {
    return FirebaseFirestore.instance
        .collection("chat_room")
        .doc(chatroomId)
        .collection("chats")
        .snapshots();
  }
}
