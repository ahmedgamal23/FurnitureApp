import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/variables.dart';
import 'package:furniture_app/furniture/presentation/screen/home_page.dart';
import 'authentication/presentation/controller/shared_preference_login.dart';
import 'authentication/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  bool ch = await SharedPreferenceLogin().checkSharedPreferenceLogin();
  runApp(MyApp(check: ch,));
}

class MyApp extends StatelessWidget {
  final bool check;
  const MyApp({super.key, this.check=false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Variables.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: check?const HomePage():const LoginScreen(),
    );
  }

}
