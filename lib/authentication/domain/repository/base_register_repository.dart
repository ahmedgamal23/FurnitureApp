import '../entities/register.dart';

abstract class BaseRegisterRepository {
  Future<bool> setRegisterData(Register register);
}

