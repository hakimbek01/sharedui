

class User {
  String? email;
  String? password;
  User({this.password,this.email});
  User.fromJson(Map<String,dynamic> json) {
    email=json['email'];
    password=json['password'];
  }

  Map<String, dynamic> toJson()=>{'email':email,'password':password};

}