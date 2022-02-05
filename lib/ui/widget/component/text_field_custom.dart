import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  String hintText;
  Function validationFun;
  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon endIcon;
  bool isHidden;

  WidgetTextField(
      {this.validationFun,
      this.hintText,
      this.inputType,
      this.controller,
      this.icon,
      this.endIcon,
      this.isHidden = false,
      Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      obscureText: isHidden,
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      //validator: (value) => validationFun(value),
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
