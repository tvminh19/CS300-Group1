import 'package:flutter/material.dart';

TextFormField myInputForm(String hint, bool obscuteTextOption, TextEditingController textEditingController){
  return TextFormField(
    validator: (value){
      return value!.isEmpty || value.length < 2? hint + " Wrong!" : null;
    },
    controller: textEditingController,
    decoration: InputDecoration(
      hintText: hint,
    ),
    obscureText: obscuteTextOption,
  );
}