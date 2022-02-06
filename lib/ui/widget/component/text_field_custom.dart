import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  String hintText;
  Function validationFun;
  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon endIcon;
  bool isHiidden;

  WidgetTextField(
      {this.validationFun,
      this.hintText,
      this.inputType,
      this.controller,
      this.icon,
      this.endIcon,
      this.isHiidden = false,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      style: TextStyle(color: Colors.white),
      //obscureText: isHidden,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validationFun(value),
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: icon,
        suffixIcon: endIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
