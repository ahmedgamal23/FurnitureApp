import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceLogin{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveSharedPreferenceData(String id , String username , String password)async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString("id" , id);
    prefs.setString("username" , username);
    prefs.setString("password" , password);
  }

  Future<bool> checkSharedPreferenceLogin()async{
    final SharedPreferences prefs = await _prefs;
    String? user = prefs.getString("username");
    print("************************");
    print(user);
    print("************************");
    if(user!="" && user!=null){
      // this user login before
      return true;
    }
    return false;
  }

  Future<String> getCurrentUserId()async{
    final SharedPreferences prefs = await _prefs;
    String? id = prefs.getString("id");
    if(id!="" && id!=null){
      // this user login before
      return id;
    }
    return "";
  }

}
