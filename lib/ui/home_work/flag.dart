import 'dart:math';

import 'package:flutter/material.dart';

class FlagScreen extends StatelessWidget {
  const FlagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flag"),
      ),
      body: Center(
        child: Container(
          child: CustomPaint(
            size: const Size(360,600),
            painter: FlagPainter(),
          ),
        ),
      ),
    );
  }
}

class FlagPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    //rects
    final mainRect = Rect.fromLTWH(0, 0, 360, 80);
    final whiteRect = Rect.fromLTWH(0, 92, 360, 80);
    final greenRect = Rect.fromLTWH(0, 184, 360, 80);
    final lineOne = Rect.fromLTWH(0, 80, 360, 12);
    final lineTwo = Rect.fromLTWH(0, 172, 360, 12);
    final blueOne = Paint()..color=Colors.blueAccent..style=PaintingStyle.fill;
    final redOne = Paint()..color=Colors.red..style=PaintingStyle.fill;
    final whiteOne = Paint()..color=Colors.white..style=PaintingStyle.fill;
    final greenONe = Paint()..color=Colors.green..style=PaintingStyle.fill;
    canvas.drawRect(mainRect, blueOne);
    canvas.drawRect(lineOne, redOne);
    canvas.drawRect(whiteRect, whiteOne);
    canvas.drawRect(lineTwo, redOne);
    canvas.drawRect(greenRect, greenONe);
    //stars
    final moon = Rect.fromCircle(center: Offset(size.width*.14, size.height*.065), radius: 24);
    final moonPaint = Paint()..color=Colors.white..strokeWidth=8..style=PaintingStyle.stroke;
    canvas.drawArc(moon, pi*.44,pi*1.04,false,moonPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
