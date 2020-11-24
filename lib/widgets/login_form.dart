import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom:30,
      left:responsive.wp(10),
      right:responsive.wp(10),
      child: Column(
        children: [
          InputText(
            label:'Email Address',
            keyboardType:TextInputType.emailAddress
          ),
          InputText(
            label:'Password',
            obscureText:true
          ),
        ],
      ),
    );
  }
}