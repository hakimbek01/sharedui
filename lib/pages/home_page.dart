import 'package:flutter/material.dart';
import 'package:sharedui/service/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello Welcome to Uzbekistan",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
            ElevatedButton(
              onPressed: () {
                removeUserCreate();
              },
              child: Text("Remove CreateUser"),
            ),
            ElevatedButton(
              onPressed: () {
                dataRemove();
              },
              child: Text("Remove User"),
            )
          ],
        )
      ),
    );
  }

  void removeUserCreate(){
    PrefsService.removeCreateUser();
  }

  void dataRemove(){
    PrefsService.removeUser();
  }

}
