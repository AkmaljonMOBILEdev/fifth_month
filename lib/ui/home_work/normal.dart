import 'dart:math';

import 'package:flutter/material.dart';

class NormalScreen extends StatelessWidget {
  const NormalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal"),
      ),
      body: Center(
        child: Container(
          child: CustomPaint(
            size: const Size(300,300),
            painter: EmojiePainter(),
          ),
        ),
      ),
    );
  }
}

class EmojiePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    //circle
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final circlePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, circlePaint);
    //eyes
    final eyePaint = Paint()..color = Colors.yellow;
    canvas.drawCircle(Offset(center.dx * .6, center.dy * .7), 20, eyePaint);
    canvas.drawCircle(Offset(center.dx * 1.4, center.dy * .7), 20, eyePaint);
    //action
    final actionPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ;
    canvas.drawArc(Rect.fromLTWH(center.dx*.5, center.dy+center.dy*.18, radius, 20), pi, pi, false, actionPaint);
    // canvas.drawArc(Rect.fromPoints(Offset(center.dx*.2, center.dy*1.3), Offset(center.dx+center.dx*.35, center.dy*1.3)), pi, pi, true, actionPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
