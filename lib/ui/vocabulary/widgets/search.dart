import 'package:fifth_month/data/network/api_service.dart';
import 'package:fifth_month/getx/vocabulary_controller/vocabulary_controller.dart';
import 'package:fifth_month/utils/colors.dart';
import 'package:fifth_month/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchWord extends StatelessWidget {
  const SearchWord({super.key, required this.onTap, required this.controller, });
  final VoidCallback onTap;
  final TextEditingController controller;
  // final ValueChanged<String> onChanged;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1.17,
      height: size.height / 18.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.lightBlueAccent.withOpacity(.4)
           ),
      child: Stack(
        children: [
          SizedBox(
            width: (size.width / 1.17)-40,
            child: TextField(
              // onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  prefixIcon: Padding(
                    padding:  EdgeInsets.all(10.0.w),
                    child: SvgPicture.asset(AppIcons.search),
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                      color: AppColors.c1D1D1D,
                      fontSize: 18
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:  BorderSide(
                          width: 0.w,
                          color: Colors.white
                      )
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 58,
              height: size.height / 18.8,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16))
              ),
              child: IconButton(onPressed: onTap, icon: SvgPicture.asset(AppIcons.arrow)),
            ),
          )
        ],
      )
    );
  }
}
