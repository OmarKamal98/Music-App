import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/model/user.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/provider/auth_provider.dart';
import 'package:musicapp/ui/screen/main_screen/home_secreen.dart';
import 'package:musicapp/ui/screen/sign_screen/login.dart';
import 'package:musicapp/ui/screen/sign_screen/sign_up.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List splashImg = [
    'assets/images/splash1.png',
    'assets/images/splash2.png',
    'assets/images/splash3.png',
  ];

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((v) {
      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        RouterClass.routerClass.pushWidgetReplacement(SignUp());
      } else {
        Provider.of<AuthProvider>(context, listen: false).getUserFromFirebase();
        RouterClass.routerClass.pushWidgetReplacement(HomeScreen());
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: Column(
        children: [
          Column(children: [
            CarouselSlider.builder(
                itemCount: splashImg.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: Image.asset(
                      splashImg[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 407,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  autoPlay: true,
                )),
          ]),
          Container(
              margin: EdgeInsets.only(top: 111.h, left: 40.w),
              child: Text(
                "WELCOME TO                          GEEZ APP",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 37.sp),
              )),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.all(40.h),
            child: defaultButton(
                text: "GET STARTED",
                radius: 2,
                width: double.infinity,
                function: () {
                  RouterClass.routerClass.pushWidgetReplacement(Login());
                }),
          )
        ],
      ),
    );
  }
}
