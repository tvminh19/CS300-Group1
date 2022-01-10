import 'package:chat_app/services/helper_function.dart';
import 'package:chat_app/view/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    getLogginState();
    super.initState();
  }

  getLogginState() async {
    await HelperFunction.getUserLoggedIn().then((value) {
      if (value != null){
        setState(() {
          isLoggedIn = value;
        });
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: isLoggedIn? const ChatRoomScreen() : const LoginScreen(),
      home: const LoginScreen(),
    );
  }
}
