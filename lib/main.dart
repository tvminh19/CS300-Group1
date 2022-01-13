// Minh's
import 'package:chat_app/services/constance.dart';
import 'package:chat_app/view/chat_room_screen.dart';
import 'package:chat_app/view/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Duy's
import 'package:flutter/material.dart';
import 'package:paylo_chat/pages/home.dart';
import 'package:paylo_chat/pages/login/login.dart';
import 'package:paylo_chat/pages/signup/signup.dart';

// Minh's
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  @override
  void initState() {
    isLoggedIn = Constance.isLoggedIn;
    super.initState();
  }
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paylo! chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn? const ChatRoomScreen() : const LoginScreen()
    );
  }
}
