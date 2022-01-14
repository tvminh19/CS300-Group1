import 'dart:developer';

import 'package:paylo_chat/services/auth.dart';
import 'package:paylo_chat/services/constance.dart';
import 'package:paylo_chat/services/database.dart';
import 'package:flutter/material.dart';
import 'package:paylo_chat/view/signin.dart';

import 'chat_room_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController confirmPasswordTC = TextEditingController();

  bool isLoading = false;

  DatabaseMethod databaseMethod = DatabaseMethod();
  AuthMethods authMethods = AuthMethods();

  signMeUp() {
    setState(() {
      isLoading = true;
    });

    String username = usernameTC.text.trim();
    String email = emailTC.text.trim();
    String password = passwordTC.text.trim();
    String confirmPassword = confirmPasswordTC.text.trim();

    if (username == "" ||
        email == "" ||
        password == "" ||
        confirmPassword == "") {
      setState(() {
        isLoading = false;
      });

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text("Empty fields.\n"
              "Please check your input and try again."),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else if (confirmPassword != password) {
      setState(() {
        isLoading = false;
      });

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Warning'),
          content: const Text("Mismatching password/confirm password.\n"
              "Please check your password and try again."),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      authMethods.signUpWithEmailAndPassword(email, password).then((val) {
        if (val != null) {
          log("Sign up successful: " + email);

          Map<String, String> userInfoMap = {"name": username, "email": email};

          databaseMethod.uploadUserInfo(userInfoMap);

          Constance.email = email;
          Constance.myName = username;
          Constance.isLoggedIn = true;

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const ChatRoomScreen()));
        } else {
          setState(() {
            isLoading = false;
          });

          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: const Text(
                  "Registration failed, please check your info and try again.\n"
                  "If you already have an aacount, please login to continue."),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/left_circle.png',
                            height: 130,
                            width: 130,
                          ),
                        ),
                        const SizedBox(width: 150),
                        Align(
                          child: Image.asset(
                            'assets/circle.png',
                            height: 60,
                            width: 60,
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
                      height: 40,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.account_circle),
                          label: const Text(
                            'Username',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        controller: usernameTC,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.email),
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
                      height: 15,
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
                      height: 15,
                    ),
                    SizedBox(
                      width: 350,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.password),
                          label: const Text(
                            'Confirm Password',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        controller: confirmPasswordTC,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child:
                            const Text('Already have an account? Log in now.'),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: signMeUp,
                      child: const Text(
                        'REGISTER',
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
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Or login with'),
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
