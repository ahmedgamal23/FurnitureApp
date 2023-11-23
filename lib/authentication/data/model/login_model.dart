import 'package:furniture_app/authentication/domain/entities/login.dart';

class LoginModel extends Login{
  const LoginModel({required super.id ,required super.username, required super.password});

  factory LoginModel.fromFirebase(Map<String , dynamic> data){
    return LoginModel(id: data["id"],username: data["username"], password: data["password"]);
  }
}
