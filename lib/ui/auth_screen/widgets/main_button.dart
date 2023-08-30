import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.title, required this.onTap});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: 180,
      child: ElevatedButton(onPressed: onTap, child: Text(title)),
    );
  }
}
