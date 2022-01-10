import 'package:flutter/material.dart';

BoxDecoration myBoxDecoration(Color color, double cirRadius) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(cirRadius),
    border: Border.all(color: Colors.black)
  );
}
