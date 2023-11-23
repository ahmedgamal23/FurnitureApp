import '../entities/login.dart';

abstract class BaseLoginRepository{
  Future<Login> getLoginData(String username);
}
