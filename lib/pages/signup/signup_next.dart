import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paylo_chat/components/custom_box.dart';

class SignUpNext extends StatefulWidget {
  const SignUpNext({Key? key}) : super(key: key);

  @override
  _SignUpNextState createState() => _SignUpNextState();
}

class _SignUpNextState extends State<SignUpNext> {
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
              icon: Icon(Ionicons.pencil_sharp),
              content: 'Your full name',
              isObscure: false,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomBox(
              icon: Icon(Icons.date_range_sharp),
              content: 'Date of birth',
              isObscure: false,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomBox(
              icon: Icon(Icons.phone),
              content: 'Phone number',
              isObscure: false,
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
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: const Size(170, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: Colors.black)),
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
