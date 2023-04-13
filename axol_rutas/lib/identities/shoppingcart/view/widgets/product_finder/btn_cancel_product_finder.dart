import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/theme.dart';

class BtnCancelProductFinder extends StatelessWidget {
  const BtnCancelProductFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: ColorPalette.secondary),
        child: const Text(
          'Cancelar',
          style: Typo.textButton,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      //const BtnCancelProductFinderController(),
    ]);
  }
}
