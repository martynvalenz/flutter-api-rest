import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/authentication_api.dart';
import 'package:flutter_api_rest/utils/dialogs.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/input_text.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = new GlobalKey();
  String _email = '', _password = '', _username = '';
  final AuthenticationApi _authenticationApi = AuthenticationApi();

  Future<void> _submit() async{
    
    final isOk = _formKey.currentState.validate();
    if(isOk){
      ProgressDialog.show(context);
      await _authenticationApi.register(
        username: _username,
        email: _email,
        password: _password
      );
      ProgressDialog.dismiss(context);

    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom:30,
      child: Container(
        constraints:BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key:_formKey,
          child: Column(
            children: [
              InputText(
                label:'Username',
                fontSize: responsive.dp(responsive.isTablet ? 1.4 : 1.8),
                onChanged: (text){
                  _username= text;
                },
                validator: (text){
                  if(text.trim().length > 5){
                    return null;
                  }
                  return 'Is not a valid username';
                },
              ),
              SizedBox(height: responsive.dp(3)),
              InputText(
                label:'Email Address',
                keyboardType:TextInputType.emailAddress,
                fontSize: responsive.dp(responsive.isTablet ? 1.4 : 1.8),
                onChanged: (text){
                  _email = text;
                },
                validator: (text){
                  Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);

                  if(regExp.hasMatch(text)){
                    return null;
                  }
                  return 'Is not a valid Email';
                },
              ),
              SizedBox(height: responsive.dp(3)),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12
                    )
                  )
                ),
                child:Row(
                  children: [
                    Expanded(
                      child: InputText(
                        label:'Password',
                        obscureText:true,
                        borderEnabled: false,
                        fontSize: responsive.dp(responsive.isTablet ? 1.4 : 1.8),
                        onChanged: (text){
                          _password = text;
                        },
                        validator:(text){
                          if(text.trim().length < 6){
                            return 'Invalid password';
                          }
                          return null;
                        }
                      ),
                    ),
                    FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child:Text(
                        'SHOW',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.5)
                        )
                      ),
                      onPressed: (){},
                    )
                  ],
                )
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width:double.infinity,
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child:Text(
                    'Sign In',
                    style: TextStyle(
                      color:Colors.white,
                      fontSize: responsive.dp(1.8)
                    )
                  ),
                  onPressed:this._submit,
                  color:Colors.pinkAccent
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?', style:TextStyle(fontSize: responsive.dp(1.5))),
                  FlatButton(
                    child:Text('Sign In', style: TextStyle(color:Colors.pinkAccent, fontSize: responsive.dp(1.5))),
                    onPressed: (){
                      Navigator.pushNamed(context, 'login');
                    },
                  )
                ],
              ),
              SizedBox(height: responsive.dp(10))
            ],
          ),
        ),
      ),
    );
  }
}