import 'package:equatable/equatable.dart';

class Register extends Equatable{
  final String name;
  final String username;
  final String email;
  final String password;
  final int phoneNumber;
  final String address;

  const Register({required this.name, required this.username, required this.email,
        required this.password,required this.phoneNumber, required this.address});

  @override
  // TODO: implement props
  List<Object?> get props => [name , username , email , password , phoneNumber , address];
}
