import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_app/authentication/data/model/login_model.dart';

abstract class BaseLoginDataSource{
  Future<LoginModel> getLoginData( String username);
}

class LoginDataSource extends BaseLoginDataSource{
  static String currentUseId="";

  @override
  Future<LoginModel> getLoginData(String username) async {
    // TODO: Call Collection
    CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
    // TODO: Check username and get snapshot
    QuerySnapshot querySnapshot = await collectionReference.where('username', isEqualTo: username).limit(1).get();
    // TODO: Get current user id
    currentUseId = querySnapshot.docs[0].id;

    if(querySnapshot.size > 0)
    {
      /// user is exist
      print("user is exist");
      /// get data
      DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
      return LoginModel(id:currentUseId ,username: documentSnapshot['username'], password: documentSnapshot['password']);
    }else
    {
      /// error in data
      print("user not exist");
      return const LoginModel(id:"" ,username: "", password: "");
    }
  }

}
