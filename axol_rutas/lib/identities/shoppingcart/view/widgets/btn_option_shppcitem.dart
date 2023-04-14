import 'package:flutter/material.dart';

import '../../../../settings/theme.dart';

class BtnOptionShppcItem extends StatelessWidget {
  final String text;
  final Color color;
  final int action;

  const BtnOptionShppcItem(
      {super.key,
      required this.text,
      required this.color,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: color),
      child: Text(
        text,
        style: Typo.textButton,
      ),
      onPressed: () async {},
    );
  }
}
