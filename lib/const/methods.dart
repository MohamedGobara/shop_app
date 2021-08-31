



import 'package:flutter/material.dart';

void navpush (Widget mywidget , context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => mywidget));
}

void navpushreplas (Widget mywidget , context){

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> mywidget)) ;


}

void pop (Widget mywidget , context){

  Navigator.pop(context, MaterialPageRoute(builder: (context)=> mywidget)) ;


}