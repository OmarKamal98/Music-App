import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:musicapp/navigator/router_class.dart';
import 'package:musicapp/provider/auth_provider.dart';
import 'package:musicapp/ui/screen/sign_screen/login.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:musicapp/ui/widget/component/text_field_custom.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController emailControl = TextEditingController();
  validateEmail(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email';
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Color(0xFF0E0B1F),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 112.h, left: 24.w),
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            Container(
              height: 72.h,
              width: 250.w,
              margin: EdgeInsets.only(left: 24.w),
              child: Text(
                'If you need help resetting your password, we can help by sending you a link to    reset it.',
                style: TextStyle(fontSize: 14.sp, color: Color(0xFF8D92A3)),
              ),
            ),
            SizedBox(
              height: 85.h,
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(left: 40.w, right: 40.w),
              child: WidgetTextField(
                validationFun: validateEmail,
                hintText: 'E-Mail',
                inputType: TextInputType.emailAddress,
                controller: emailControl,
                icon: Icon(
                  Icons.alternate_email,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
                height: 46.h,
                margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 66.h),
                child: defaultButton(
                    text: "sent",
                    radius: 2,
                    width: double.infinity,
                    function: () {
                      Provider.of<AuthProvider>(context, listen: false)
                          .forgetPassword(emailControl.text);
                      emailControl.clear();
                      RouterClass.routerClass.pushWidgetReplacement(Login());
                    })),
          ],
        ),
      ),
    );
  }
}
