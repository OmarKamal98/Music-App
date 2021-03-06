import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/provider/auth_provider.dart';
import 'package:musicapp/ui/screen/main_screen/main_navegation_bar/main_nav_screen.dart';
import 'package:musicapp/ui/screen/sign_screen/sign_up.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

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
    Future.delayed(Duration(seconds: 5)).then((v) {
      User user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        RouterClass.routerClass.pushWidgetReplacement(SignUp());
      } else {
        // Provider.of<AuthProvider>(context, listen: false).getUserFromFirebase();
        RouterClass.routerClass.pushWidgetReplacement(MainNav());
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/splashcover.webp'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Column(children: [
              CarouselSlider.builder(
                  itemCount: splashImg.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
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
                    height: 400,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(milliseconds: 1000),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                  )),
            ]),
            Container(
                margin: EdgeInsets.only(top: 100.h, left: 40.w, right: 20.w),
                child: Text(
                  "welcome".tr(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 37.sp),
                )),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.all(40.h),
              child: defaultButton(
                  text: 'started'.tr(),
                  radius: 2,
                  width: double.infinity,
                  function: () {
                    User user = FirebaseAuth.instance.currentUser;
                    if (user == null) {
                      RouterClass.routerClass.pushWidgetReplacement(SignUp());
                    } else {
                      // Provider.of<AuthProvider>(context, listen: false)
                      //     .getUserFromFirebase();
                      RouterClass.routerClass.pushWidgetReplacement(MainNav());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
