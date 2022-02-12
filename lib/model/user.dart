import 'package:flutter/material.dart';

class UserApp {
  String id;
  String name;
  String phone;
  String email;
  String password;

  UserApp({
    this.id,
    @required this.name,
    this.phone = '0595217143',
    @required this.email,
    @required this.password,
  });
  UserApp.fromMap(Map map) {
    this.name = map['name'];
    this.phone = map['phone'];
    this.email = map['email'];
    this.id = map['id'];
  }
  toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'email': this.email,
      'id': this.id
    };
  }
}
