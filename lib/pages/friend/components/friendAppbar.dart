import 'package:flutter/material.dart';

class FriendAppBar extends StatelessWidget with PreferredSizeWidget {
  const FriendAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Friends'));
  }
}
