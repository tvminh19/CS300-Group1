import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paylo! Chat'
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        items: const<Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.home, size: 30)
        ],
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
