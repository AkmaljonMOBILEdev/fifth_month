import 'dart:async';
import 'dart:typed_data';

import 'package:fifth_month/cubits/check_cubit.dart';
import 'package:fifth_month/ui/home_screen/widgets/buttons.dart';
import 'package:fifth_month/ui/home_screen/widgets/detailed.dart';
import 'package:fifth_month/ui/home_screen/widgets/shot_and_share.dart';
import 'package:fifth_month/utils/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey screenKey = GlobalKey();
  Uint8List? imageBytes;
  bool isShot = false;
  Timer? _timer;
  int _start = 0;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_start == 2) {
        _timer!.cancel();
        context.read<CheckCubit>().clearScreenShot();
      } else {
        debugPrint(_start.toString());
        _start++;
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: screenKey,
      child: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          title: const Text("Payment details"),
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<CheckCubit, CheckState>(
          listener: (context, state) {
            if (state.image!.isNotEmpty) {
              startTimer();
              isShot = true;
            }
          },
          builder: (context, state) {
            return Center(
              child: Stack(
                children: [
                  Column(
                    children: [
                      20.bh,
                      Text(
                        "Scan QR Code",
                        style: TextStyle(
                            fontSize: 28.sp, fontWeight: FontWeight.w700),
                      ),
                      12.bh,
                      Text(
                        "NIA BUS",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "NMID : 123412341234",
                        style: TextStyle(
                            fontSize: 12.sp, fontWeight: FontWeight.w400),
                      ),
                      48.bh,
                      SizedBox(
                          width: 250.w,
                          height: 250.h,
                          child: Image.asset(
                            "assets/qr_code.png",
                          )),
                      const DetailedInfo(),
                      GlobalButton(
                        title: "Take Screenshot",
                        onTap: () {
                          context
                              .read<CheckCubit>()
                              .takeScreenShotAndSave(screenKey);
                        },
                      )
                    ],
                  ),
                  isShot && state.image!.isNotEmpty
                      ? Align(
                          alignment: Alignment.topRight,
                          child: ShotAndShareButton(
                            byte: state.image!,
                            onShare: () {
                              context.read<CheckCubit>().shareImage(state.image!);
                              // context.read<CheckCubit>().shareImage(state.image!);
                            },
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
