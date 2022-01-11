import 'dart:developer';
import 'package:chat_app/Widgets/my_appbar.dart';
import 'package:chat_app/Widgets/my_box_decorator.dart';
import 'package:chat_app/Widgets/my_btn.dart';
import 'package:chat_app/Widgets/my_input_form.dart';
import 'package:chat_app/Widgets/my_text_style.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/constance.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/view/chat_room_screen.dart';
import 'package:chat_app/view/signup.dart';
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
  final formKey = GlobalKey<FormState>();
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  AuthMethods authMethods = AuthMethods();
  DatabaseMethod databaseMethod = DatabaseMethod();
  bool isLoading = false;
  late QuerySnapshot querySnapshot;

  signIn() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      querySnapshot = await databaseMethod.getUserbyEmail(emailTC.text);
      if (querySnapshot.size != 0) {
        Constance.myName = querySnapshot.docs[0].get("name");
        log("[OKAY] saveUserName -> " + Constance.myName);
      } else {
        log("querysnapshoot is null");
      }

      Constance.email = emailTC.text;
      authMethods
          .signInWithEmailAndPassword(emailTC.text, passwordTC.text)
          .then((value) {
        if (value != null) {
          Constance.isLoggedIn = true;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatRoomScreen(),
              ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Mini Chat"),
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        myInputForm("Email", false, emailTC),
                        myInputForm("Password", true, passwordTC),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: const Text("Forgot your password?"),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: myBtn(
                        "Login",
                        myTextStyle(
                          18,
                          Colors.white,
                          FontWeight.w300,
                        ),
                        myBoxDecoration(Colors.blue, 30)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  myBtn(
                    "Sign In with Google",
                    myTextStyle(
                      18,
                      Colors.black,
                      FontWeight.w300,
                    ),
                    myBoxDecoration(Colors.white, 30),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Dont have an account?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignupScreen()));
                        },
                        child: const Text(
                          "Register now",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
