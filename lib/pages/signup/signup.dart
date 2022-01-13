import 'package:flutter/material.dart';
import 'package:paylo_chat/components/custom_box.dart';
import 'package:paylo_chat/pages/signup/signup_next.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Row(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/left_circle.png',
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(width: 150),
              Align(
                child: Image.asset(
                  'assets/circle.png',
                  height: 70,
                  width: 70,
                ),
              ),
            ]),
            const Text(
              'Paylo!',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Align(
              alignment: Alignment(0.3, -0.5),
              child: Text(
                'Chat',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomBox(
              icon: Icon(Icons.account_circle),
              content: 'Email/Username',
              isObscure: true,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomBox(
              icon: Icon(Icons.password),
              content: 'Password',
              isObscure: true,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomBox(
              icon: Icon(Icons.password),
              content: 'Confirm Password',
              isObscure: true,
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text('Forgot Password?'),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Color.fromRGBO(51, 104, 206, 1),
              child: IconButton(
                icon: Icon(Icons.arrow_forward, color: Colors.white),
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpNext()))
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Or sign up with'),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/google.png',
                  height: 40,
                ),
                const SizedBox(width: 50),
                Image.asset(
                  'assets/facebook.png',
                  height: 40,
                ),
                const SizedBox(width: 50),
                const Icon(
                  Icons.phone,
                  size: 40,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
