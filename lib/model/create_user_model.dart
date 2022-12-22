

class CreateUser {
  String? name;
  String? email;
  String? phone;
  String? password;
  CreateUser({this.name,this.email,this.password,this.phone});
  CreateUser.fromJson(Map<String,dynamic> json) {
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    password=json['password'];
  }

  Map<String, dynamic> toJson()=>{"name":name,"email":email,"phone":phone,"password":password,
  };
}