import 'dart:math';

import 'package:flutter/material.dart';

class Smiling extends StatelessWidget {
  const Smiling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smiling"),
      ),
      body: Center(
        child: Container(
          child: CustomPaint(
            size: const Size(300, 300),
            painter: EmojiePainter(),
          ),
        ),
      ),
    );
  }
}

class EmojiePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //circle
    final radius = min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final circlePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, circlePaint);
    //eyes
    final eyePaint = Paint()..color = Colors.green;
    canvas.drawCircle(Offset(center.dx * .6, center.dy * .7), 20, eyePaint);
    canvas.drawCircle(Offset(center.dx * 1.4, center.dy * .7), 20, eyePaint);
    //action
    final actionPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ;
    canvas.drawArc(
        Rect.fromCircle(center: Offset(center.dx, center.dy), radius: radius*.49),
        0,
        pi,
        false,
        actionPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
