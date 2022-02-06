import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/ui/widget/component/component.dart';

class Account extends StatefulWidget {
  const Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0B1F),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            margin: EdgeInsets.only(top: 66.h),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 48.sp),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 33.h,),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/splash1.png',
                            width: 80.w,
                            height: 80.h,
                            fit: BoxFit.cover,
                          ),
                          Column(

                            children: [
                              Text(
                                "22",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                "playlist",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),

                            ],
                          ),
                          Column(

                            children: [
                              Text(
                                "360 K",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                "Follower",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),

                            ],
                          ),
                          Column(

                            children: [
                              Text(
                                "56",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              Text(
                                "Following",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),

                            ],
                          ),
                        ],
                      ),
                      defaultButton(text: "Edit",width:78.w ,function: (){},height: 28,radius: 2,)
                    ],
                  ),
                SizedBox(height: 33.h,),
                  Text("Library",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp),),
                  SizedBox(height: 20.h,),
                  libraryItem(prefixIcon: Icon(Icons.my_library_music_outlined,color: Colors.white,),text:"My playlist",function: (){}, ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(height: 10.h,),
                  libraryItem(prefixIcon: Icon(Icons.album_outlined,color: Colors.white,),text:"Album",function: (){}, ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(height: 10.h,),
                  libraryItem(prefixIcon: Icon(Icons.video_library_outlined,color: Colors.white,),text:"MV",function: (){}, ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(height: 10.h,),
                  libraryItem(prefixIcon: Icon(Icons.contacts_outlined,color: Colors.white,),text:"Artist",function: (){}, ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(height: 10.h,),
                  libraryItem(prefixIcon: Icon(Icons.download,color: Colors.white,),text:"Download",function: (){}, ),
                  Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                  SizedBox(height: 41.h,),
                  Text("Recent Activity",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.sp),),
                  SizedBox(height: 16.h,),
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h,),
                      SingleChildScrollView(
                        scrollDirection:Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16,),
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16,),
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16,),
                            Image.asset(
                              'assets/images/splash1.png',
                              width: 80.w,
                              height: 80.h,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]



            ),
          ),
        ),
      ),
    );
  }
}
