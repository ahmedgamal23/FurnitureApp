import 'package:furniture_app/authentication/domain/usecase/login_usecase.dart';
import '../../domain/entities/login.dart';

class GetLoginData{
  final BaseLoginUseCase baseLoginUseCase;
  GetLoginData(this.baseLoginUseCase);

  Future<Login> getData(String username)async{
    return await baseLoginUseCase.execute(username);
  }
}
