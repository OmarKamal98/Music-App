import 'package:flutter/material.dart';

class SocilButton extends StatelessWidget {
  Color color;
  IconData icon;
  Color iconColor;
  Function ontap;
  SocilButton({this.color, this.icon, this.iconColor, this.ontap});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        ontap;
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }
}
