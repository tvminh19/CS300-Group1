import 'package:chat_app/Widgets/my_appbar.dart';
import 'package:chat_app/Widgets/my_box_decorator.dart';
import 'package:chat_app/Widgets/my_btn.dart';
import 'package:chat_app/Widgets/my_input_form.dart';
import 'package:chat_app/Widgets/my_text_style.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/services/helper_function.dart';
import 'package:chat_app/view/signin.dart';
import 'package:flutter/material.dart';

import 'chat_room_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  DatabaseMethod databaseMethod = DatabaseMethod();
  AuthMethods authMethods = AuthMethods();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  signMeUp() {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> userInfoMap = {
        "name": usernameTC.text,
        "email": emailTC.text
      };

      HelperFunction.saveUserEmail(emailTC.text);
      HelperFunction.saveUserName(usernameTC.text);

      authMethods
          .signUpWithEmailAndPassword(emailTC.text, passwordTC.text)
          .then((val) {
        databaseMethod.uploadUserInfo(userInfoMap);
        HelperFunction.saveUserLoggedIn(true);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ChatRoomScreen()));
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
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        myInputForm("User name", false, usernameTC),
                        myInputForm("Email", false, emailTC),
                        myInputForm("Password", true, passwordTC),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      signMeUp();
                    },
                    child: myBtn(
                        "Sign Up",
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
                    "Sign Up with Google",
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
                      const Text("Already have account?"),
                      const SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "Sign In now",
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
