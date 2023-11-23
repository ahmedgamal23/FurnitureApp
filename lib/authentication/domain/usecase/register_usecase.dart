import 'package:furniture_app/authentication/domain/repository/base_register_repository.dart';
import '../entities/register.dart';

abstract class BaseRegisterUseCase{
  Future<bool> execute(Register register);
}

class RegisterUseCase extends BaseRegisterUseCase{
  final BaseRegisterRepository baseRegisterRepository;
  RegisterUseCase(this.baseRegisterRepository);

  @override
  Future<bool> execute(Register register)async{
    return await baseRegisterRepository.setRegisterData(register);
  }
}
