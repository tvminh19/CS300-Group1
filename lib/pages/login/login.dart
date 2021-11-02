import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Paylo!',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'Chat',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Login'),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Forgot Password'),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: () {},
              child: Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
