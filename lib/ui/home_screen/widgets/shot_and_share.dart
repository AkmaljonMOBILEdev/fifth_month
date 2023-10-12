import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShotAndShareButton extends StatelessWidget {
  const ShotAndShareButton(
      {super.key, required this.byte, required this.onShare});

  final Uint8List byte;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.w),
        width: 160.w,
        height: 260.h,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.deepPurple, width: 1.w)),
        child: Center(
          child: Column(
            children: [
              Image.memory(
                byte,
                width: 140.w,
                height: 200.h,
              ),
              ElevatedButton(onPressed: onShare, child: const Text("Share"))
            ],
          ),
        ));
  }
}
