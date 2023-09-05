import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.isAge = false,
  });

  final String hintText;
  final ValueChanged<String> onChanged;
  final bool isAge;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: TextField(
        onChanged: onChanged,
        keyboardType: isAge ? TextInputType.number : TextInputType.text,
        inputFormatters: [if (isAge) FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide:
                  BorderSide(color: Colors.deepPurpleAccent, width: 2.w)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide(color: Colors.green, width: 2.w)),
        ),
      ),
    );
  }
}
