import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/model/user.dart';
import 'package:musicapp/provider/auth_provider.dart';
import 'package:musicapp/ui/widget/component/component.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import '../../../navigator/router_class.dart';
import '../../widget/component/social_button_circle.dart';
import '../../widget/component/text_field_custom.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final Color facebookColor = const Color(0xff39579A);

  final Color twitterColor = const Color(0xff00ABEA);

  final Color googleColor = const Color(0xffDF4A32);

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passController = TextEditingController();

  bool isPass = true;

  validateEmail(String value) {
    if (!isEmail(value)) {
      return 'InCorrect Email';
    }
  }

  String nullValidator(String value) {
    if (value.isEmpty) {
      return 'RequiredField'.tr();
    }
    return null;
  }

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
                image: AssetImage('assets/images/signup.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60.h, left: 40.w),
              child: Text(
                'SignUp'.tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 64.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                validationFun: nullValidator,
                hintText: 'Name'.tr(),
                inputType: TextInputType.name,
                controller: nameController,
                icon: Icon(
                  Icons.person_pin,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: 295.w,
              height: 35.h,
              margin: EdgeInsets.only(top: 64.h, left: 40.w, right: 40.w),
              child: WidgetTextField(
                validationFun: validateEmail,
                hintText: 'E-Mail'.tr(),
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
                validationFun: (validator) {
                  if (validator.isEmpty) return 'Required Field';
                  if (validator != passController.text) return 'Error Password';
                  return null;
                },
                isPassword: isPass,
                hintText: 'Password'.tr(),
                inputType: TextInputType.visiblePassword,
                controller: passController,
                endIconFunction: () {
                  setState(() {
                    isPass = !isPass;
                  });
                },
                icon: Icon(Icons.lock, color: Colors.white),
                endIcon: isPass == true
                    ? Icon(Icons.remove_red_eye, color: Colors.white)
                    : Icon(Icons.remove_red_eye_outlined, color: Colors.white),
              ),
            ),
            Container(
                height: 46.h,
                margin: EdgeInsets.only(left: 40.w, right: 40.w, top: 66.h),
                child: defaultButton(
                    text: "SignUp".tr(),
                    radius: 2,
                    width: double.infinity,
                    function: () {
                      UserApp user = UserApp(
                        email: emailController.text,
                        name: nameController.text,
                        password: passController.text,
                      );
                      Provider.of<AuthProvider>(context, listen: false)
                          .createUser(user);
                    })),
            Container(
              margin: EdgeInsets.only(top: 64.h),
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
                        "connectwith".tr(),
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
                    'haveaccount'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {
                        RouterClass.routerClass.pushByName('login');
                      },
                      child: Text(
                        'signIn'.tr(),
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
