import 'package:flutter/material.dart';

import '../../../../../settings/theme.dart';

class TextFieldFinder extends StatelessWidget {
  const TextFieldFinder({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
            child: TextFormField(
              //controller: _searchController,
              autofocus: false,
              obscureText: false,
              //onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  hintText: 'Buscar',
                  hintStyle: Typo.hintText,
                  filled: true,
                  fillColor: ColorPalette.secondaryBackground,
                  border: InputBorder.none),
              style: Typo.textField1,
            ),
          ),
        ),
        IconButton(
          iconSize: 30,
          color: ColorPalette.secondaryText,
          icon: const Icon(
            Icons.cancel,
          ),
          onPressed: () {
            /*_searchController.clear();
            _runFilter('');*/
          },
        )
      ],
    );
  }
}
