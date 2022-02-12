import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context, widget) => Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigatePop(context)=>Navigator.pop(context);
void showToast({
  required String txt,
  required ToastState state
}){
  Fluttertoast.showToast(
      msg:txt,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{SUCCESS,ERROR,WRONG}
 Color? chooseToastColor(ToastState state){

  Color color;
  switch(state){
    case ToastState.SUCCESS:
      color =Colors.green;
      break;
    case ToastState.ERROR:
      color =Colors.red;
      break;
    case ToastState.WRONG:
      color =Colors.yellow;
      break;
      return color;
  }
  return color;
}