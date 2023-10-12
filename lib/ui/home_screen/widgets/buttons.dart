import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: InkWell(
        splashColor: Colors.limeAccent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.deepPurpleAccent,
              border: Border.all(color: Colors.transparent)),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
          ),
        ),
      ),
    );
  }
}
