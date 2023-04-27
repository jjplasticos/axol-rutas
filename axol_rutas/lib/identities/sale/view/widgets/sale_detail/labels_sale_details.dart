import 'package:flutter/material.dart';

import '../../../../../settings/format.dart';
import '../../../../../settings/theme.dart';
import 'link_location.dart';

class LabelsSaleDetails extends StatelessWidget {
  final String time;
  final String uid;
  final String location;
  final String custumer;

  const LabelsSaleDetails(
      {super.key,
      required this.time,
      required this.uid,
      required this.location,
      required this.custumer});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(custumer, style: Typo.textButton),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(FormatDate.dmy(time), style: Typo.labelText1),
            LinkLocation(location: location),
            Text(uid, style: Typo.labelText1),
          ],
        )
      ],
    );
  }
}
