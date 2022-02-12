import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';

class EditAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xFF0E0B1F),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 64.h,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      RouterClass.routerClass.popFunction();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.white,
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 110.w),
                  child: Text(
                    'Edie Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF7A7C81),
                    borderRadius: BorderRadius.circular(15)),
                height: 540,
                width: 400,
                margin: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      children: [],
                    )
                  ],
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/splash1.png')),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey),
                      margin: EdgeInsets.only(left: 60, top: 60),
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.add_a_photo)),
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
