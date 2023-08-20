import 'package:flutter/material.dart';

class SnowmanScreen extends StatelessWidget {
  const SnowmanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snowman"),
      ),
      body: Center(
        child: Container(
          child: CustomPaint(
            size: const Size(260,620),
            painter: SnowmanPainter(),
          ),
        ),
      ),
    );
  }
}

class SnowmanPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black..style=PaintingStyle.stroke..strokeWidth=4;

    // Draw snowman circles
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.75), 80, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.55), 60, paint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.40), 40, paint);

    // Draw snowman's eyes
    final eyePaint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 - 20, size.height * 0.38), 5, eyePaint);
    canvas.drawCircle(Offset(size.width / 2 + 20, size.height * 0.38), 5, eyePaint);

    // Draw snowman's nose
    final nosePaint = Paint()..color = Colors.orange;
    final nosePath = Path()
      ..moveTo(size.width / 2, size.height * 0.48)
      ..lineTo(size.width / 2+size.width*.4, size.height * 0.47 - 23)
      ..lineTo(size.width / 2, size.height * 0.4 - .2)
      ..close();
    canvas.drawPath(nosePath, nosePaint);

    // Draw snowman's mouth dots
    final mouthDotPaint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 - 10, size.height * 0.25), 2, mouthDotPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.25), 2, mouthDotPaint);
    canvas.drawCircle(Offset(size.width / 2 + 10, size.height * 0.25), 2, mouthDotPaint);

    // // Draw snowman's hat
    // final hatPaint = Paint()..color = Colors.black..style=PaintingStyle.stroke..strokeWidth=4;
    // final hatPath = Path()
    //   ..addRect(Rect.fromLTRB(size.width / 2 - 25, size.height * 0.25, size.width / 2 + 25, size.height * 0.25))
    //   ..addRect(Rect.fromLTRB(size.width / 2 - 40, size.height * 0.1, size.width / 2 + 40, size.height * 0.15));
    // canvas.drawPath(hatPath, hatPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
