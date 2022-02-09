import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color buttonColor = Color(0xFFCBFB5E);
const Color searchColor = Color(0xFF363942);
const Color screenColor = Color(0xFF0E0B1F);



Widget defaultButton({
  double width = double.infinity,
  double  radius = 10.0,
  Color background = buttonColor,
  bool isUpperCase = true,
  double height = 40,
  @required Function  function,
  @required String text,
})=> Container(
  width: width,
  height: height,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      isUpperCase ?text.toUpperCase(): text,
      style:  TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
      ),
    ),
  ),
  decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(radius)
  ),
);


Widget libraryItem({
  double width = double.infinity,
  double  radius = 10.0,
  Color background ,
  @required Icon prefixIcon ,

  double height = 40,
  @required Function  function,
  @required String text,


})=>InkWell(
  onTap: function,
  child:   Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        color: screenColor,

        borderRadius: BorderRadius.circular(radius)

    ),
      child: Column(
        children: [
          Row(
            children: [
             prefixIcon,
            SizedBox(width:20.w ,),
              Text(
                 text,
                style:  TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
             const Spacer(),

              const Icon(Icons.arrow_right,color: Colors.white,),

            ],
          ),



        ],
      ),

    ),



);

Widget cardMusic({
  double width = double.infinity,
  double  radius = 10.0,
  double height = 40,
  @required Function onTapFun ,
  @required Image image,
  @required Text title,
  @required Text subtitle,

})=> ListTile(
  onTap: onTapFun,
  leading: image,
  title: title,
  subtitle: subtitle,
 trailing: Icon(Icons.more_vert_outlined ,color: Colors.white,),
);









Widget searchField({
  @required Function function,
  double  radius = 10.0,
  Icon suffixIcon ,

})=> Container(

width: double.infinity,
height: 40.h,


  child:  TextField(
      decoration:  InputDecoration(
      
        hintText: 'Search',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search,color: Colors.white,),
        suffixIcon: suffixIcon
        ),

    onTap: function,
),
  decoration: BoxDecoration(
      color: searchColor,
      borderRadius: BorderRadius.circular(radius)
  ),
);

Widget defaultFormField ({

   @required  TextEditingController controller,
  @required TextInputType type,
  @required Function onSubmit,
  @required Function validate,
  @required String  label,
  @required IconData prefix,

})=> TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted:  onSubmit(),
  validator: validate(),

  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    border: const OutlineInputBorder(),
  ),
);

