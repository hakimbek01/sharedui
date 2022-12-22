import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sharedui/pages/sign_in.dart';
import 'package:sharedui/service/prefs_service.dart';

import 'create_sign_in.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Timer? timer;

  @override
  void initState() {
    funk();
    super.initState();
  }

  void funk(){
    timer= Timer.periodic(Duration(seconds: 3), (timers) {
      dataUser();
      print('Close Splash Page');
      timer!.cancel();
    });
  }

  void dataUser(){
    PrefsService.loadUser().then((value) => {
      if (value==null || value.toJson().isEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),))
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),))
      }
    });
  }
  void dataCreateUser(){
    PrefsService.loadCreateUser().then((value) => {
      if (value==null || value.toJson().isEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateSignIn(),))
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),))
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text('Loading',style: TextStyle(fontSize: 30),)
          ],
        ),
      ),
    );
  }
}
