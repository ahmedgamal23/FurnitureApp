import '../../domain/entities/register.dart';
import '../../domain/usecase/register_usecase.dart';

class SetRegisterData{
  final BaseRegisterUseCase baseRegisterUseCase;
  SetRegisterData(this.baseRegisterUseCase);

  Future<bool> setData(Register register)async{
    return await baseRegisterUseCase.execute(register);
  }
}
