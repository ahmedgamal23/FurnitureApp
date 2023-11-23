import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/authentication/data/datasource/login_datasource.dart';
import 'package:furniture_app/authentication/domain/entities/login.dart';
import 'package:furniture_app/authentication/domain/repository/base_login_repository.dart';
import 'package:furniture_app/authentication/domain/usecase/login_usecase.dart';
import 'package:furniture_app/authentication/presentation/controller/get_login_data.dart';
import '../../../core/utils/variables.dart';
import '../../../furniture/presentation/screen/home_page.dart';
import '../../data/repository/login_repositroy.dart';
import '../controller/shared_preference_login.dart';
import '../screens/register_screen.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();
  bool obscureCheck=false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// HEADER
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.3,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Variables.appNameBackgroundColor,
              borderRadius: const BorderRadius.only(bottomRight:Radius.circular(100),),
            ),
            child: const Text(
              Variables.appName,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Variables.appNameFontSize,
                color: Variables.appNameColor,
              ),
            ),
          ),
          const SizedBox(height: 80,),
          /// Fields
          Container(
            width: MediaQuery.of(context).size.width,
            //height: MediaQuery.of(context).size.height*0.5,
            margin: const EdgeInsets.only(left: 10, right: 10 ,),
            child: Form(
              key: _formKeyLogin,
              child: Column(
                children: [
                  /// USERNAME FIELD
                  TextFormField(
                    controller: usernameController,
                    validator: (value){
                      if(value==""){
                        return "username is empty";
                      }
                    },
                    style: const TextStyle(fontSize: 20,),
                    cursorColor: Variables.appNameBackgroundColor,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      label: const Text("Username"),
                      labelStyle: TextStyle(color: Variables.appNameBackgroundColor),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  /// PASSWORD FIELD
                  TextFormField(
                    controller: passwordController,
                    validator: (value){
                      if(value==""){
                        return "password is empty";
                      }
                    },
                    obscureText: !obscureCheck,
                    cursorColor: Variables.appNameBackgroundColor,
                    keyboardAppearance: Brightness.dark,
                    style: const TextStyle(fontSize: 20,),
                    decoration: InputDecoration(
                      label: const Text("Password"),
                      labelStyle: TextStyle(color: Variables.appNameBackgroundColor),
                      suffixIconColor: obscureCheck?Variables.appNameBackgroundColor:Colors.black87,
                      suffixIcon: InkWell(
                        child: Icon(!obscureCheck?Icons.visibility_off:Icons.visibility) ,
                        onTap: (){setState(() {obscureCheck=!obscureCheck;});},),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  /// DON'T HAVA ACCOUNT
                  Row(
                    children: [
                      const Text("Don't have an account"),
                      const SizedBox(width: 3,),
                      InkWell(
                        onTap: (){
                          /// click here to register
                          Navigator.of(context).push( MaterialPageRoute(builder: (context){return const RegisterScreen();} ) );
                        },
                        child: const Text("here" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: Colors.blue ),),
                      ),
                    ],
                  ),
                  /// LOGIN BUTTON
                  InkWell(
                    onTap: ()async{
                      bool check=false;
                      /// CHECK VALIDATION
                      if (_formKeyLogin.currentState!.validate()) {
                        //_formKeyLogin.currentState?.save();
                        /// HomePage
                        BaseLoginDataSource baseLoginDataSource = LoginDataSource();
                        BaseLoginRepository baseLoginRepository = LoginRepository(baseLoginDataSource);
                        BaseLoginUseCase baseLoginUseCase = LoginUseCase(baseLoginRepository);
                        Login login = await GetLoginData(baseLoginUseCase).getData(usernameController.text);
                        /// check input data for user
                        if(login.username == usernameController.text && login.password == passwordController.text)
                        {
                          /// save data in shared preference
                          SharedPreferenceLogin().saveSharedPreferenceData(login.id , login.username, login.password);
                          check = true;
                        }else{
                          check = false;
                        }
                        print("*************login************");
                        print(login);
                        print("*************************");
                      }
                      AwesomeDialog(
                        context: context,
                        dialogType: check?DialogType.success:DialogType.error,
                        animType: AnimType.rightSlide,
                        title: check?"Login Success":"Invalid username or password",
                        btnOkOnPress: (){
                          if(check){
                            Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context){return HomePage();}) );
                          }
                        },
                      ).show();
                      if (kDebugMode) {
                        print("***********************");
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      height: 50,
                      margin: const EdgeInsets.only(top: 50,),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Variables.appNameBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 23,
                          color: Variables.appNameColor,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
