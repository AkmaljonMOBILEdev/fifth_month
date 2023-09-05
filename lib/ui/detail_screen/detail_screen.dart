import 'package:fifth_month/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("${user.firstname}'s details"),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(
              text: "First name: ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: user.firstname,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.deepPurpleAccent
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: "Last name: ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: user.lastname,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.deepPurpleAccent
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: "Age: ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: user.age.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.deepPurpleAccent
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: "Gender: ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: user.gender,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.deepPurpleAccent
                  )
                )
              ]
            )),
            RichText(text: TextSpan(
              text: "Job: ",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: Colors.black
              ),
              children: [
                TextSpan(
                  text: user.jobTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Colors.deepPurpleAccent
                  )
                )
              ]
            )),
          ],
        ),
      ),
    );
  }
}
