import 'package:furniture_app/authentication/domain/entities/login.dart';
import '../repository/base_login_repository.dart';

abstract class BaseLoginUseCase{
  Future<Login> execute(String username);
}

class LoginUseCase extends BaseLoginUseCase{
  final BaseLoginRepository baseLoginRepository;
  LoginUseCase(this.baseLoginRepository);

  @override
  Future<Login> execute(String username) {
    return baseLoginRepository.getLoginData(username);
  }

}
