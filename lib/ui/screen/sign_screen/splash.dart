import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              margin:  EdgeInsets.only(top: 111.h, left: 40.w  ),
              child: Text(
                "WELCOME TO                          GEEZ APP",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 37.sp),
              )),


        ],
      ),
    );
  }
}
