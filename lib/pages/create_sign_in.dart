import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharedui/model/create_user_model.dart';
import 'package:sharedui/pages/home_page.dart';
import 'package:sharedui/pages/sign_in.dart';
import 'package:sharedui/service/prefs_service.dart';

class CreateSignIn extends StatefulWidget {
  const CreateSignIn({Key? key}) : super(key: key);

  @override
  State<CreateSignIn> createState() => _CreateSignInState();
}

class _CreateSignInState extends State<CreateSignIn> {

  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _phone=TextEditingController();
  TextEditingController _password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back,color: Colors.black,size: 30,),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Let's Get Started!",style: TextStyle(fontSize: 25,letterSpacing: 1.5,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text("Create an account to Q Allure toget all features",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 30,),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Center(
                  child: TextField(
                    controller: _name,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue,width: 2)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        prefixIcon: Icon(Icons.person_outline,color: Colors.blueAccent,),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Name',
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
                    controller: _email,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue,width: 2)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        prefixIcon: Icon(Icons.mail,color: Colors.blueAccent,),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
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
                    controller: _phone,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.blue,width: 2)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,width: 2),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        prefixIcon: Icon(Icons.phone_android,color: Colors.blueAccent,),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: 'Phone',
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
                      prefixIcon: Icon(Icons.lock_open,color: Colors.blueAccent,),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              MaterialButton(
                color: Colors.blue.shade900,
                minWidth: 190,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                height: 50,
                onPressed: (){
                  dataUser();
                  setState(() {
                    if (_email.text.isEmpty || _phone.text.isEmpty || _password.text.isEmpty || _name.text.isEmpty) {
                      print("inValid");
                    } else {
                      print('Valid');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    }
                  });
                },
                child: Text("CREATE",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.grey),),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn(),));
                      });
                    },
                    child: Text("Login here"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void dataUser(){
    CreateUser user=CreateUser(email: _email.text,password: _password.text,name: _name.text,phone: _phone.text);
    PrefsService.storeCreateUser(user);
    PrefsService.loadCreateUser().then((value) => {
      print(value!.toJson())
    });
  }

}
