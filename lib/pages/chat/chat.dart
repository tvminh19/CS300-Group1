import 'package:flutter/material.dart';
import 'package:paylo_chat/pages/chat/components/user_item.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      SizedBox(
        width: 350,
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.password),
            label: const Text(
              'Search',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      UserItem(
          fullName: 'Trinh Van Minh',
          lastMessage: 'What\'s going on?',
          imageUrl: 'imageUrl',
          messageNumer: 5),
    ]);
  }
}
