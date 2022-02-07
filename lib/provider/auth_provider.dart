import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/data/firebase/auth_helper.dart';
import 'package:musicapp/data/firebase/firestore_helper.dart';
import 'package:musicapp/model/user.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/main_screen/main_navegation_bar/main_nav_screen.dart';
import 'package:musicapp/ui/screen/sign_screen/sign_up.dart';

class AuthProvider extends ChangeNotifier {
  UserApp loggedUser;
  createUser(UserApp userApp) async {
    try {
      UserCredential x = await AuthHelper.authHelper
          .createNewAccount(userApp.email, userApp.password);
      userApp.id = x.user.uid;
      this.loggedUser = userApp;
      FirestoreHelper.firestoreHelper.createUser(userApp);
      if (x != null) {
        RouterClass.routerClass.pushWidgetReplacement(MainNav());
      } else {
        log('error occured');
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  login({String email, String password}) async {
    UserCredential x = await AuthHelper.authHelper.signIn(email, password);
    await getUserFromFirebase();
    if (x != null) {
      RouterClass.routerClass.pushWidget(MainNav());
      // navigate to home
    } else {
      log('error occured');
    }
  }

  getUserFromFirebase() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    this.loggedUser =
        await FirestoreHelper.firestoreHelper.getUserFromFs(userId);
    notifyListeners();
  }

  logOut() async {
    await AuthHelper.authHelper.logout();
    RouterClass.routerClass.pushWidget(SignUp());
  }

  forgetPassword(String email) async {
    AuthHelper.authHelper.forgetPassword(email);
  }
}
