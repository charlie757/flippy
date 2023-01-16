import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/flippybird.png',
      height: 60,
      width: 60,
    );
  }
}
