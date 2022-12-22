import 'package:flutter/material.dart';
import 'package:sharedui/pages/create_sign_in.dart';
import 'package:sharedui/service/prefs_service.dart';

import '../model/user_model.dart';
import 'home_page.dart';



class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}


class _SignInState extends State<SignIn> {

  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  bool borderColor=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-80,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Image(
                        image: AssetImage('assets/images/img.png'),
                        height: 140,
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Log in to your existant account of Q Alfure',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.blue,width: 2)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(color: Colors.white,width: 2,)
                                ),
                                prefixIcon: Icon(Icons.person_outline,color: Colors.blueAccent,),
                                // border: OutlineInputBorder(borderSide: BorderSide.none),
                                hintText: 'Email',
                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: TextField(
                            controller: _password,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blue,width: 2)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white,width: 2),
                                borderRadius: BorderRadius.circular(30)
                              ),
                              prefixIcon: Icon(Icons.lock,color: Colors.blueAccent,),
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password',style: TextStyle(color: Colors.black54),),
                      ),
                      SizedBox(height: 10,),
                      MaterialButton(
                        minWidth: 190,
                        height: 50,
                        color: Colors.blue.shade900,
                        onPressed: () {
                          dataService();
                          setState(() {
                            if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                              print('Valid');
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                            } else {
                              print('inValid');
                            }
                          });
                        },
                        child: Text('LOG IN',style: TextStyle(color: Colors.white),),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      SizedBox(height: 30,),
                      Text("Or connect Using",style: TextStyle(color: Colors.grey),),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            color: Colors.teal,
                            onPressed: ()=>print(_email.text),
                            height: 40,
                            minWidth: 130,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.facebook,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Facebook',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                          MaterialButton(
                            color: Colors.redAccent,
                            onPressed: ()=>print(_password.text),
                            height: 40,
                            minWidth: 130,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.g_mobiledata,color: Colors.white,size: 27,),
                                SizedBox(width: 10,),
                                Text('Google',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: (){
                        dataRemove();
                        setState(() {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateSignIn(),));
                        });
                      },
                      child: Text("Sign Up"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void dataService(){
    User user =User(password: _password.text,email: _email.text);
    PrefsService.storeUser(user);
    PrefsService.loadUser().then((value) => {
      print(value!.toJson())
    });
  }

  void dataRemove(){
    PrefsService.removeUser();
  }

}
