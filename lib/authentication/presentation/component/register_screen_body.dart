import 'package:flutter/material.dart';
import 'package:furniture_app/authentication/data/datasource/register_datasource.dart';
import 'package:furniture_app/authentication/data/repository/register_repository.dart';
import 'package:furniture_app/authentication/domain/entities/register.dart';
import 'package:furniture_app/authentication/domain/repository/base_register_repository.dart';
import 'package:furniture_app/authentication/domain/usecase/register_usecase.dart';
import '../../../core/utils/variables.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../screens/login_screen.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});
  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  bool obscureCheck=false;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// HEADER
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.2,
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
          /// Fields
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 10, right: 10 ,top: 10 , bottom: 50),
            child: Form(
              key: _formKeyRegister,
              child: Column(
                children: [
                  /// NAME FIELD
                  TextFormField(
                    controller: nameController,
                    validator: (value){
                      if(value=="") {
                        return "name field is empty";
                      }
                    },
                    style: const TextStyle(fontSize: 20,),
                    cursorColor: Variables.appNameBackgroundColor,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      label: const Text("Name"),
                      labelStyle: TextStyle(color: Variables.appNameBackgroundColor),
                    ),
                  ),
                  /// USERNAME FIELD
                  TextFormField(
                    controller: usernameController,
                    validator: (value){
                      if(value=="") {
                        return "username field is empty";
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
                  /// EMAIL FIELD
                  TextFormField(
                    controller: emailController,
                    validator: (value){
                      if(value=="") {
                        return "email field is empty";
                      }
                    },
                    style: const TextStyle(fontSize: 20,),
                    cursorColor: Variables.appNameBackgroundColor,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      labelStyle: TextStyle(color: Variables.appNameBackgroundColor),
                    ),
                  ),
                  /// PASSWORD FIELD
                  TextFormField(
                    controller: passwordController,
                    validator: (value){
                      if(value=="") {
                        return "password field is empty";
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
                  /// PHONE NUMBER FIELD
                  TextFormField(
                    controller: phoneController,
                    validator: (value){
                      if(value=="") {
                        return "phone number field is empty";
                      }
                    },
                    style: const TextStyle(fontSize: 20,),
                    cursorColor: Variables.appNameBackgroundColor,
                    keyboardAppearance: Brightness.dark,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      label: const Text("Phone Number"),
                      labelStyle: TextStyle(color: Variables.appNameBackgroundColor),
                    ),
                  ),
                  /// ADDRESS FIELD
                  TextFormField(
                    controller: addressController,
                    validator: (value){
                      if(value=="") {
                        return "address field is empty";
                      }
                    },
                    style: const TextStyle(fontSize: 20,),
                    cursorColor: Variables.appNameBackgroundColor,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      label: const Text("Address"),
                      labelStyle: TextStyle(color: Variables.appNameBackgroundColor),
                    ),
                  ),
                  /// ALREADY HAVA ACCOUNT
                  Row(
                    children: [
                      const Text("Already have an account"),
                      const SizedBox(width: 3,),
                      InkWell(
                        onTap: (){
                          /// click here to login
                          Navigator.of(context).push( MaterialPageRoute(builder: (context){return const LoginScreen();} ) );
                        },
                        child: const Text("here" , style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700,color: Colors.blue ),),
                      ),
                    ],
                  ),
                  /// REGISTER BUTTON
                  InkWell(
                    onTap: ()async{
                      bool result = false;
                      /// CHECK VALIDATION
                      if(_formKeyRegister.currentState!.validate()){
                        /// GO TO HomePage
                        BaseRegisterDataSource baseRegisterDataSource= RegisterDataSource();
                        BaseRegisterRepository baseAuthenticationRepository = RegisterRepository(baseRegisterDataSource);
                        BaseRegisterUseCase baseRegisterUseCase = RegisterUseCase(baseAuthenticationRepository);
                        result = await baseRegisterUseCase.execute(
                            Register(name: nameController.text, username: usernameController.text,
                                email: emailController.text, password: passwordController.text,
                                phoneNumber: int.parse(phoneController.text), address: addressController.text)
                        );

                        AwesomeDialog(
                          context: context,
                          dialogType: result?DialogType.success:DialogType.error,
                          animType: AnimType.rightSlide,
                          title: result?"Registration Success":"Registration Failed",
                          btnOkOnPress: (){
                            Navigator.of(context).push( MaterialPageRoute(builder: (context){return LoginScreen();}) );
                          },
                        ).show();

                        print("*************************");
                        print(result);
                        print("*************************");
                      }
                      print("*************************");
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
                        "Register",
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

          )
        ],
      ),
    );
  }
}
