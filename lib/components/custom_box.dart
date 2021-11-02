import 'package:flutter/material.dart';

class CustomBox extends StatefulWidget {
  final String content;
  final Icon icon;
  final bool isObscure;

  const CustomBox({
    Key? key,
    required this.content,
    required this.icon,
    required this.isObscure,
  }) : super(key: key);

  @override
  _CustomBoxState createState() => _CustomBoxState();
}

class _CustomBoxState extends State<CustomBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: TextField(
        obscureText: widget.isObscure,
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          label: Text(
            widget.content,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
