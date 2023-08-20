import 'package:flutter/material.dart';

class EmojiScreen extends StatelessWidget {
  const EmojiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snowman"),
      ),
      body: Center(
        child: Container(
          // child: CustomPaint(
          //   size: const Size(260,620),
          //   painter: EmojiePainter(),
          // ),
        ),
      ),
    );
  }
}
//
// class EmojiePainter extends CustomPainter{
//   @override
//   void paint(Canvas canvas, Size size) {
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
// }
