import 'package:furniture_app/authentication/domain/entities/login.dart';
import '../../domain/repository/base_login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginRepository extends BaseLoginRepository{
  final BaseLoginDataSource baseLoginDataSource;
  LoginRepository(this.baseLoginDataSource);

  /// get Data
  @override
  Future<Login> getLoginData(String username) async {
    return await baseLoginDataSource.getLoginData(username);
  }

}

