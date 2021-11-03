import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ChatAppBar extends StatefulWidget with PreferredSizeWidget {
  const ChatAppBar({Key? key}) : super(key: key);

  @override
  _ChatAppBarState createState() => _ChatAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatAppBarState extends State<ChatAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Chat',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(Ionicons.person_add_sharp),
          color: Colors.black,
        ),
      ],
      leading: Padding(
          padding: EdgeInsets.all(6),
          child: CircleAvatar(
            child: Image.asset('assets/user_avt.png'),
          )),
    );
  }
}
