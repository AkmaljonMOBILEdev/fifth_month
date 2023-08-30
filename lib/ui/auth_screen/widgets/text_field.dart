import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: TextField(
        controller: controller,
        style: TextStyle(
            fontSize: 20.sp, color: Colors.green, fontWeight: FontWeight.w800),
        decoration: InputDecoration(
          hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 20.sp,
              color: Colors.deepOrange.withOpacity(.7),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.green, width: 2.w)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: Colors.deepOrange, width: 1.w))),
      ),
    );
  }
}
