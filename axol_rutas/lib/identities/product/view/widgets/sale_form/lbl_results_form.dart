// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class LblResultsForm extends StatelessWidget {
  final String resultQuantity;
  final String resultWeight;
  final String resultPrice;

  const LblResultsForm(
      {super.key,
      required this.resultQuantity,
      required this.resultWeight,
      required this.resultPrice});

  @override
  Widget build(BuildContext context) {
    const String lbl_ITEMS = '# de articulos:';
    const String lbl_WEIGHT = 'Peso total:';
    const String lbl_PRICE = 'Precio total:';

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              lbl_ITEMS,
              style: Typo.labelText1,
            ),
            Text(
              resultQuantity,
              style: Typo.bodyText4,
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              lbl_WEIGHT,
              style: Typo.labelText1,
            ),
            Text(
              resultWeight,
              style: Typo.bodyText4,
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              lbl_PRICE,
              style: Typo.labelText1,
            ),
            Text(
              resultPrice,
              style: Typo.bodyText4,
            )
          ],
        )
      ],
    );
  }
}
