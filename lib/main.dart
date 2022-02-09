import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/provider/auth_provider.dart';
import 'package:musicapp/ui/screen/main_screen/home_secreen.dart';
import 'package:musicapp/ui/screen/main_screen/setting.dart';
import 'package:musicapp/ui/screen/sign_screen/login.dart';
import 'package:musicapp/ui/screen/sign_screen/splash.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: () => MaterialApp(
              navigatorKey: RouterClass.routerClass.navKey,
              routes: RouterClass.routerClass.map,
              builder: (context, widget) {
                ScreenUtil.setContext(context);
                return MediaQuery(
                  //Setting font does not change with system font size
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },
              home: HomeScreen(),
            ));
    //return MaterialApp(home: MusicApp());
  }
}

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}
