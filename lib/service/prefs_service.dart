
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedui/model/create_user_model.dart';
import 'package:sharedui/model/user_model.dart';


class PrefsService {
  //from user
  static storeUser(User user) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String strUser=jsonEncode(user);
    await prefs.setString('user', strUser);
  }
  
  static Future<User?> loadUser() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? strUser=prefs.getString('user');
    if (strUser==null || strUser.isEmpty) return null;
    Map<String, dynamic> map=jsonDecode(strUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.remove('user');
  }


  //from createUser

  static storeCreateUser(CreateUser createUser)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String strcreateUser=jsonEncode(createUser);
    await prefs.setString('createUser', strcreateUser);
  }

  static Future<CreateUser?> loadCreateUser()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String? strcreateUser=prefs.getString("createUser");
    if (strcreateUser==null || strcreateUser.isEmpty) return null;
    Map<String,dynamic> map=jsonDecode(strcreateUser);
    return CreateUser.fromJson(map);
  }

  static Future<bool> removeCreateUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.remove('createUser');
  }

}

