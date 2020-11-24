import 'package:flutter/material.dart';
import 'package:flutter_api_rest/pages/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_rest/pages/register.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rest Api',
      theme:ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: LoginPage(),
      routes:{
        RegisterPage.routeName:(_) => RegisterPage(),
        LoginPage.routeName:(_) => LoginPage(),
      }
    );
  }
}