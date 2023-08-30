import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logoAxol2.png',
      width: 250,
      height: 250,
      fit: BoxFit.cover,
    );
  }
}
