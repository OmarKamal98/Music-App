import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  String buttonName;
  Function onPressed;
  CustomButton({this.buttonName, this.onPressed});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFCBFB5E),
      ),
    );
  }
}
