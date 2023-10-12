import 'package:fifth_month/utils/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailedInfo extends StatelessWidget {
  const DetailedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.r),
        color: const Color(0xFFF4F4F4),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Amount: ",style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600
              ), ),
              Text("\$ 50,000",style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400
              ), ),
            ],
          ),
          8.bh,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Percent: ",style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600
              ), ),
              Text("% 0.5",style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400
              ), ),
            ],
          ),
        ],
      ),
    );
  }
}
