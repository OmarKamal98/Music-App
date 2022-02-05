import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color buttonColor = Color(0xFFCBFB5E);
const Color searchColor = Color(0xFF363942);


Widget defaultButton({
  double width = double.infinity,
  double  radius = 10.0,
  Color background = buttonColor,
  bool isUpperCase = true,
  @required Function  function,
  @required String text,
})=> Container(
  width: width,
  height: 46.h,
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


Widget searchField({
  @required Function function,
  double  radius = 10.0,
})=> Container(

width: double.infinity,
height: 40.h,


  child:  TextField(
      decoration: const InputDecoration(
      
        hintText: 'Search',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.search,color: Colors.white,),
        suffixIcon: Icon(Icons.cancel)

        ),

    onTap: function,
),
  decoration: BoxDecoration(
      color: searchColor,
      borderRadius: BorderRadius.circular(radius)
  ),
);
