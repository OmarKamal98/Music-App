import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/widget/component/component.dart';

class MyPlayList extends StatelessWidget {
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
                    'Playlist',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: searchField(function: () {}),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.h),
              child: defaultButton(function: () {}, text: 'Add playlist'),
            )
          ],
        ),
      ),
    );
  }
}
