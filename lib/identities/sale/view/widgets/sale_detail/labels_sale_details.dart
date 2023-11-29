import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';
import 'link_location.dart';

class LabelsSaleDetails extends StatelessWidget {
  final int dateTime;
  final String uid;
  final String location;
  final String custumer;

  const LabelsSaleDetails(
      {super.key,
      required this.dateTime,
      required this.uid,
      required this.location,
      required this.custumer});

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.fromMillisecondsSinceEpoch(dateTime);
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(custumer, style: Typo.textButton),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}',
            style: Typo.labelText1),
            LinkLocation(location: location),
            Text(uid.split('-').first, style: Typo.labelText1),
          ],
        )
      ],
    );
  }
}
