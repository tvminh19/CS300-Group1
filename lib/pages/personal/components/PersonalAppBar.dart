import 'package:flutter/material.dart';

class PersonalAppBar extends StatelessWidget with PreferredSizeWidget {
  const PersonalAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('Personal'));
  }
}
