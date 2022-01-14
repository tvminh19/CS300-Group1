import 'dart:developer';
import 'package:paylo_chat/services/auth.dart';
import 'package:paylo_chat/services/constance.dart';
import 'package:paylo_chat/services/database.dart';
import 'package:paylo_chat/view/chat_room_screen.dart';
import 'package:paylo_chat/view/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailTC = TextEditingController();
  final passwordTC = TextEditingController();

  bool isLoading = false;

  AuthMethods authMethods = AuthMethods();
  DatabaseMethod databaseMethod = DatabaseMethod();

  late QuerySnapshot querySnapshot;

  login() async {
    setState(() {
      isLoading = true;
    });

    String email = emailTC.text.trim();
    String password = passwordTC.text.trim();

    querySnapshot = await databaseMethod.getUserbyEmail(email);
    if (querySnapshot.size != 0) {
      Constance.myName = querySnapshot.docs[0].get("name");
      log("[OKAY] saveUserName -> " + Constance.myName);
    } else {
      log("querysnapshoot is null");
    }

    Constance.email = email;
    authMethods.signInWithEmailAndPassword(email, password).then((value) {
      if (value != null) {
        Constance.isLoggedIn = true;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatRoomScreen(),
            ));
      } else {
        setState(() {
          isLoading = false;
        });

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error'),
            content: const Text(
                "Login failed, please check your info and try again.\n"
                "If you are a new user, please sign up to continue."),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                children: [
                  Row(
                    children: [
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
                    ],
                  ),
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
                        suffixIcon: const Icon(Icons.account_circle),
                        label: const Text(
                          'Email',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: emailTC,
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
                      controller: passwordTC,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: login,
                    child: const Text(
                      'LOGIN',
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
                          side: const BorderSide(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('Or login with'),
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
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Text(
                      'Don\'t have an account?',
                    ),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()))
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }

  @override
  void dispose() {
    emailTC.dispose();
    passwordTC.dispose();
    super.dispose();
  }
}
