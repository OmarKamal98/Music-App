import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Image.asset('assets/images/splash1.png').blurred(
                      colorOpacity: 0.2,
                      borderRadius: BorderRadius.circular(5),
                      blur: 20,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 15, right: 15),
                      child: Image.asset('assets/images/splash1.png').blurred(
                        borderRadius: BorderRadius.circular(5),
                        blur: 0,
                        colorOpacity: 0.0,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   body: Container(
    //     child: SingleChildScrollView(
    //       scrollDirection: Axis.horizontal,
    //       child: Container(
    //         color: Colors.red,
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height * .4,
    //         child: Row(
    //           children: [
    //             Stack(
    //               children: [
    //                 Container(
    //                     width: 50,
    //                     height: 50,
    //                     margin: EdgeInsets.only(top: 20.h, left: 20.w),
    //                     child: Image.asset('assets/images/splash1.png',
    //                         fit: BoxFit.cover)),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
