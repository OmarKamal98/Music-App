import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  String hintText;
  Function validationFun;
  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon endIcon;
  bool isPassword;
  Function endIconFunction;
  WidgetTextField(
      {this.validationFun,
      this.hintText,
      this.inputType,
      this.controller,
      this.icon,
      this.endIcon,
      this.endIconFunction,
      this.isPassword = false,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      style: TextStyle(color: Colors.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => validationFun(value),
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: icon,
        suffixIcon: endIcon != null
            ? IconButton(onPressed: endIconFunction, icon: endIcon)
            : null,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
