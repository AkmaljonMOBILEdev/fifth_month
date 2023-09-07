import 'package:fifth_month/utils/colors.dart';
import 'package:fifth_month/utils/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/icons.dart';

class BottomMenuPart extends StatelessWidget {
  const BottomMenuPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      width: double.infinity,
      height: (theSize(context).height/12).h,
      decoration: const BoxDecoration(
        color: AppColors.c1C1C1C
      ),
      child: Center(
        child: Row(
          children: [
            IconButton(onPressed: (){},
                splashColor: Colors.transparent,
                icon: SvgPicture.asset(AppIcons.attachment, width: 20.w,height: 20.h,)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              width: (theSize(context).width/1.48).w,
              height: (theSize(context).height/18.8).h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: AppColors.c090909
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.sp
                      ),
                      cursorHeight: 18.h,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                        hintText: "Message...",
                        hintStyle: TextStyle(
                          color: AppColors.c828282
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r)
                        )
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.emoji_emotions, size: 20.w,color: AppColors.c828282,))
                ],
              )
            ),
            IconButton(onPressed: (){},
                splashColor: Colors.transparent,
                icon: SvgPicture.asset(AppIcons.microphone, width: 20.w,height: 20.h,))
          ],
        ),
      ),
    );
  }
}
