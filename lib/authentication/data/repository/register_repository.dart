import 'package:furniture_app/authentication/domain/entities/login.dart';
import 'package:furniture_app/authentication/domain/entities/register.dart';
import 'package:furniture_app/authentication/domain/repository/base_register_repository.dart';
import '../datasource/register_datasource.dart';

class RegisterRepository extends BaseRegisterRepository{
  final BaseRegisterDataSource baseRegisterDataSource;
  RegisterRepository(this.baseRegisterDataSource);

  /// Set Register Data
  @override
  Future<bool> setRegisterData(Register register) async {
    return await baseRegisterDataSource.setRegisterData(register);
  }

}
