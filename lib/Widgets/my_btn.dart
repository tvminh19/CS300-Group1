import 'package:flutter/material.dart';

Container myBtn(String title, TextStyle textStyle, BoxDecoration boxDecoration) {
  return Container(
    height: 50,
    width: 200,
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 5),
    decoration: boxDecoration,
    child: Text(
      title,
      style: textStyle,
    ),
  );
}
