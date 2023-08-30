import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MathTextField extends StatelessWidget {
  const MathTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
    this.isLast = false,
  });

  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: TextField(
        textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(isLast?2:3),
          // FilteringTextInputFormatter.allow(RegExp('[2-9][0-9]{2}|1000')),
        ],
        controller: controller,
        onChanged: onChanged,
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
