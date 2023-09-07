import 'package:fifth_month/data/models/data_repository/data_repository.dart';
import 'package:fifth_month/ui/chat/widgets/bottom_part.dart';
import 'package:fifth_month/ui/chat/widgets/file_holder.dart';
import 'package:fifth_month/utils/colors.dart';
import 'package:fifth_month/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.arrowBack)),
        backgroundColor: AppColors.c1C1C1C,
        centerTitle: true,
        title: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Image.asset(AppIcons.pic, width: 44.w, height: 44.h,)),
            SizedBox(width: 12.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sanjar",
                  style: TextStyle(
                      color: AppColors.white, fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: 16.sp
                  ),),
                Text("last seen 20 minutes ago",
                  style: TextStyle(
                      color: AppColors.c828282, fontWeight: FontWeight.w400, fontFamily: 'Roboto', fontSize: 8.sp
                  ),),

              ],
            )
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.call)),
          IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.more)),
        ],
      ),
      backgroundColor: AppColors.c090909,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                ...List.generate(files.length, (index){
                  var file = files[index];
                  return FileHolder(fileInfo: file,);
                })
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomMenuPart(),
          )
        ],
      )
    );
  }
}
