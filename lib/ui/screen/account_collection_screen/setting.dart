import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';

class Setting extends StatefulWidget {
  const Setting({Key key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    bool notification = false;
    Color butColor = Color(0xFFCBFB5E);
    Color pageColor = Color(0xFF0E0B1F);
    return Scaffold(
      body: Container(
        color: const Color(0xFF0E0B1F),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 110.w),
                    child: Text(
                      'Setting',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.notification_important_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Notification",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Switch(
                          value: notification,
                          activeColor: butColor,
                          onChanged: (value) {
                            setState(() {
                              notification = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.text_fields_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Display Language",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "English",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: butColor,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.equalizer_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Equalizer",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.dangerous,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Term of Service",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.headset,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Version 3.2",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(
                height: 282.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: InkWell(
                  onTap: (){},

                  child: Container(
                    width: double.infinity,
                    height: 46.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: butColor),


                    ),
                    child: Text(
                      "SING OUT",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: butColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
