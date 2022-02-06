import 'package:flutter/material.dart';

class WidgetTextFieldPass extends StatefulWidget {
  String hintText;
  Function validationFun;
  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon endIcon;
  bool isHiidden;
  Widget widgett;

  WidgetTextFieldPass(
      {this.validationFun,
      this.hintText,
      this.inputType,
      this.controller,
      this.icon,
      this.widgett,
      this.endIcon,
      this.isHiidden = false,
      Key key})
      : super(key: key);

  @override
  State<WidgetTextFieldPass> createState() => _WidgetTextFieldPassState();
}

class _WidgetTextFieldPassState extends State<WidgetTextFieldPass> {
  void togglePasswordView() {
    setState(() {
      widget.isHiidden = !widget.isHiidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      style: TextStyle(color: Colors.white),
      obscureText: widget.isHiidden,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => widget.validationFun(value),
      controller: widget.controller,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        prefixIcon: widget.icon,
        suffixIcon: widget.endIcon ??
            InkWell(
              onTap: togglePasswordView,

              /// This is Magical Function
              child: Icon(
                widget.isHiidden
                    ?

                    /// CHeck Show & Hide.
                    Icons.visibility
                    : Icons.visibility_off,
              ),
            ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white, fontSize: 16),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}

class WidgetTextField extends StatelessWidget {
  String hintText;
  Function validationFun;
  TextInputType inputType;
  TextEditingController controller;
  Icon icon;
  Icon endIcon;

  WidgetTextField(
      {this.validationFun,
      this.hintText,
      this.inputType,
      this.controller,
      this.icon,
      this.endIcon,
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
