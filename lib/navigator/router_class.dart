import 'package:flutter/material.dart';
import 'package:musicapp/ui/screen/sign_screen/sign_up.dart';

import '../ui/screen/sign_screen/login.dart';

class RouterClass {
  RouterClass._();
  static RouterClass routerClass = RouterClass._();
  GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  pushByName(String screenName) {
    navKey.currentState.pushNamed(screenName);
  }

  pushWidget(Widget widget) {
    // BuildContext context= navKey.currentState.context;
    navKey.currentState.push(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  pushWidgetReplacement(Widget widget) {
    // BuildContext context = navKey.currentState.context;
    navKey.currentState.pushReplacement(MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }

  popFunction() {
    navKey.currentState.pop();
  }

  Map<String, Widget Function(BuildContext)> map = {
    //'splash': (context) => SplashScreen(),
    'login': (context) => Login(),
    'signup': (context) => SignUp(),
  };
}
