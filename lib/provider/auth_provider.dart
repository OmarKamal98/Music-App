import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/data/firebase/auth_helper.dart';
import 'package:musicapp/data/firebase/firestore_helper.dart';
import 'package:musicapp/model/user.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/main_screen/home_secreen.dart';
import 'package:musicapp/ui/screen/sign_screen/sign_up.dart';

class AuthProvider extends ChangeNotifier {
  String name;
  String username;
  String email;
  createUser(UserApp userApp) async {
    try {
      UserCredential x = await AuthHelper.authHelper
          .createNewAccount(userApp.email, userApp.password);
      userApp.id = x.user.uid;
      FirestoreHelper.firestoreHelper.createUser(userApp);
      if (x != null) {
        RouterClass.routerClass.pushWidgetReplacement(HomeScreen());
        // navigate to home
      } else {
        log('error occured');
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  login({String email, String password}) async {
    UserCredential x = await AuthHelper.authHelper.signIn(email, password);
    if (x != null) {
      RouterClass.routerClass.pushWidget(HomeScreen());
      // navigate to home
    } else {
      log('error occured');
    }
  }

  logOut() async {
    await AuthHelper.authHelper.logout();
    RouterClass.routerClass.pushWidget(SignUp());
  }

  forgetPassword(String email) async {
    AuthHelper.authHelper.forgetPassword(email);
  }
}
