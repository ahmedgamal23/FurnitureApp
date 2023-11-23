import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_app/authentication/domain/entities/register.dart';

abstract class BaseRegisterDataSource{
  Future<bool> setRegisterData(Register register);
}

class RegisterDataSource extends BaseRegisterDataSource{
  @override
  Future<bool> setRegisterData(Register register) async {
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
    DocumentReference documentReference = collectionReference.doc();

    print("*************");
    print(register);
    print("*************");
    /// set Data to Document
    await documentReference.set({
      "name":register.name,
      "username":register.username,
      "email":register.email,
      "password":register.password,
      "phoneNumber":register.phoneNumber,
      "address":register.address
    });
    /// data saved success
    return documentReference.id.isEmpty?false:true;
  }

}
