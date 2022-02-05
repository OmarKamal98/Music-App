import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color buttonColor = Color(0xFFCBFB5E);


Widget defaultButton({
  double width = double.infinity,
  double  radius = 10.0,
  Color background = buttonColor,
  bool isUpperCase = true,
   @required Function  function,
  @required String text,
})=> Container(
  width: width,
  height: 46.0,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ?text.toUpperCase(): text,
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
    ),
  ),
  decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(radius)
  ),
);
