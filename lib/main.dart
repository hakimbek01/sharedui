import 'package:flutter/material.dart';
import 'package:sharedui/pages/create_sign_in.dart';
import 'package:sharedui/pages/sign_in.dart';
import 'package:sharedui/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //splash pagega kirib timerli funksiyadan
        // dataUser() yoki dataCreateUser() ni almashtirib dasturni ishlashini to'liq ko'rish mumkin
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}

