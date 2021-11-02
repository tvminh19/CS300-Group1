import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

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
              height: 70,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.account_circle),
                  label: const Text(
                    'Email / Username',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.password),
                  label: const Text(
                    'Password',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
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
              height: 25,
            ),
            const Text('Or sign up with'),
            const SizedBox(
              height: 40,
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
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Don\'t have an account?',
                ),
                TextButton(
                    onPressed: null,
                    child: Text(
                      'Sign Up here',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}