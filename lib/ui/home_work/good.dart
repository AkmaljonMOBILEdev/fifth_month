import 'dart:math';

import 'package:flutter/material.dart';

class GoodScreen extends StatelessWidget {
  const GoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Good"),
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
      ..color = Colors.indigo
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(center, radius, circlePaint);
    //eyes
    final eyePaint = Paint()..color = Colors.indigo;
    canvas.drawCircle(Offset(center.dx * .6, center.dy * .7), 20, eyePaint);
    canvas.drawCircle(Offset(center.dx * 1.4, center.dy * .7), 20, eyePaint);
    //action
    final actionPaint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
    ;
    canvas.drawLine(Offset(center.dx*.7, center.dy*1.3), Offset(center.dx+center.dx*.35, center.dy*1.3), actionPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
