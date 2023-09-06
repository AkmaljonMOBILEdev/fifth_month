import 'package:fifth_month/data/models/meaning_model/main_model.dart';
import 'package:fifth_month/data/models/meaning_model/meaning_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WordHolder extends StatelessWidget {
  const WordHolder({super.key, required this.meaningModel});
  final MainModel meaningModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      margin: EdgeInsets.symmetric(vertical: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.deepPurple,
          width: 1.w
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(meaningModel.word,style: TextStyle(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w700),),
            Text(meaningModel.meaningModel[0].partOfSpeech, style: TextStyle(color: Colors.deepPurple, fontSize: 10.sp, fontWeight: FontWeight.w500),)
          ],),
          Text(meaningModel.meaningModel.first.definitions.first.definition)
        ],
      ),
    );
  }
}
