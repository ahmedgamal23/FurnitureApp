
import 'package:equatable/equatable.dart';

class Login extends Equatable{
  final String id;
  final String username;
  final String password;

  const Login({required this.id , required this.username , required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [id , username , password];

}
