import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/ui/screen/sign_screen/sign_up.dart';
import 'package:musicapp/ui/widget/component/custom_buttom.dart';
import 'package:musicapp/ui/widget/component/social_button_circle.dart';
import '../../widget/component/text_field_custom.dart';

class Login extends StatelessWidget {
  final Color facebookColor = const Color(0xff39579A);
  final Color twitterColor = const Color(0xff00ABEA);
  final Color googleColor = const Color(0xffDF4A32);
  TextEditingController emailController;
  TextEditingController passController;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      // physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 103.h, left: 40.w),
              child: Text(
                'SIGN IN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 64.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                hintText: 'E-Mail',
                inputType: TextInputType.emailAddress,
                controller: emailController,
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 38.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                  hintText: 'Password',
                  inputType: TextInputType.visiblePassword,
                  controller: passController,
                  icon: Icon(Icons.lock, color: Colors.white),
                  endIcon: Icon(Icons.remove_red_eye_outlined)),
            ),
            Container(
              margin: EdgeInsets.only(left: 203.w, right: 42.w, top: 38.h),
              child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              height: 46.h,
              margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 66.h),
              child:CustomButton(buttonName: 'SIGN IN',onPressed: (){},)
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text(
              //     'SIGN IN',
              //     style: TextStyle(
              //         fontSize: 16,
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     primary: Color(0xFFCBFB5E),
              //   ),
              // ),
            ),
            Container(
              margin: EdgeInsets.only(top: 104.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          indent: 40.3.w,
                          endIndent: 17.3.w,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "Or connect with",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white,
                          indent: 8.3.w,
                          endIndent: 40.3.w,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocilButton(
                        icon: FontAwesomeIcons.facebookF,
                        color: facebookColor,
                        iconColor: Colors.white,
                        ontap: () {},
                      ),
                      SocilButton(
                        icon: FontAwesomeIcons.googlePlusG,
                        color: googleColor,
                        iconColor: Colors.white,
                        ontap: () {},
                      ),
                      SocilButton(
                        icon: FontAwesomeIcons.twitter,
                        color: twitterColor,
                        iconColor: Colors.white,
                        ontap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 47.h, left: 88.w),
              child: Row(
                children: [
                  Text(
                    'Don`t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        RouterClass.routerClass.pushByName('signup');
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xFFCBFB5E),
                            fontWeight: FontWeight.w900),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
