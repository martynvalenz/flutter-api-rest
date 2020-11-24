
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class ProgressDialog{
  static show(BuildContext context){
    showCupertinoModalPopup(
      context: context, 
      builder: (_){
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black45.withOpacity(0.7),
            child:Center(
              child:CircularProgressIndicator()
            )
          ),
        );
      }
    );
  }

  static dismiss(BuildContext context){
    Navigator.pop(context);
  }
}