import 'dart:math';

import 'package:flutter/material.dart';

class BadScreen extends StatelessWidget {
  const BadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bad"),
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
      ..color = Colors.orange
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, circlePaint);
    //eyes
    final eyePaint = Paint()..color = Colors.orange;
    canvas.drawArc(Rect.fromLTWH(center.dx-center.dx*.67, center.dy*.18, 70, 70), pi/8, 2.6*pi/5, false, eyePaint);
    canvas.drawArc(Rect.fromLTWH(center.dx+center.dx*.17, center.dy*.22, 70, 70), 2.1*pi/5, pi*.54,  false, eyePaint);
    //action
    final actionPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ;
    canvas.drawArc(Rect.fromCircle(center: Offset(center.dx, center.dy*1.5), radius: radius*.5), pi,pi, false, actionPaint);
    // canvas.drawArc(Rect.fromLTWH(center.dx*.5, center.dy+center.dy*.18, radius, 20), pi, pi, false, actionPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
