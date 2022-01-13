import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  final String fullName, lastMessage, imageUrl;
  final int messageNumer;

  const UserItem(
      {Key? key,
      required this.fullName,
      required this.lastMessage,
      required this.imageUrl,
      required this.messageNumer})
      : super(key: key);

  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        // MainAxisAlignment: MainAxisAlignment.,
        children: [
          Image.asset(
            'assets/user_avt.png',
            height: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Column(children: [
            Text(this.widget.fullName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
            Text(
              this.widget.lastMessage,
            )
          ]),
          SizedBox(
            width: 140,
          ),
          Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // You can use like this way or like the below line
                //borderRadius: new BorderRadius.circular(30.0),
                color: Colors.red,
              ),
              child: Text(
                this.widget.messageNumer.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              )),
        ],
      ),
    );
  }
}
