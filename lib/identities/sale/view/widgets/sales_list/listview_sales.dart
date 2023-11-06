// ignore_for_file: non_constant_identifier_names

import 'package:axol_rutas/identities/sale/cubit/options_edit_sale/options_edit_sale_cubit.dart';
import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:axol_rutas/identities/sale/view/controllers/sale_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/format.dart';
import '../../../../../settings/theme.dart';
import '../../../cubit/sale_detail/sale_detail_cubit.dart';
import '../../../cubit/sales_cubit/sales_view_cubit.dart';
import '../../../model/sale_form_model.dart';

class ListViewSales extends StatelessWidget {
  final List<SaleModel> listData;
  final String lbl_QUANTITY = 'Cantidad';
  final String lbl_WEIGHT_UNIT = 'kg';
  final String lbl_WEIGHT = 'Peso total';
  final String lbl_PRICE = 'Precio total';
  final bool _isSync = true;
  final String _sync = SaleModel.stSync;

  const ListViewSales({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: ((context, index) {
        final elementList = listData[index];
        final DateTime time =
            DateTime.fromMillisecondsSinceEpoch(elementList.time);
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
          child: Opacity(
            opacity: elementList.status == _sync ? 1 : 0.5,
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                  color: ColorPalette.secondaryBackground,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                          child: Text(
                            elementList.client.toString(),
                            style: Typo.bodyText1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}',
                                style: Typo.bodyText2,
                              ),
                              Text(
                                elementList.uid.toString().split('-').first,
                                style: Typo.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FormatNumber.decimal(double.parse(
                                        elementList.totalQuantity.toString())),
                                    style: Typo.bodyText3,
                                  ),
                                  Text(
                                    lbl_QUANTITY,
                                    style: Typo.labelText2,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        FormatNumber.decimal(double.parse(
                                            elementList.totalWeight
                                                .toString())),
                                        style: Typo.bodyText3,
                                      ),
                                      Text(
                                        lbl_WEIGHT_UNIT,
                                        style: Typo.bodyText3,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    lbl_WEIGHT,
                                    style: Typo.labelText2,
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '\$',
                                        style: Typo.bodyText3,
                                      ),
                                      Text(
                                        FormatNumber.decimal(double.parse(
                                            elementList.totalPrice.toString())),
                                        style: Typo.bodyText3,
                                      ),
                                    ],
                                  ),
                                  Text(
                                    lbl_PRICE,
                                    style: Typo.labelText2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
                        child: //Icono de estado
                            elementList.status == _sync
                                ? const Icon(Icons.cloud_done_outlined,
                                    color: ColorPalette.alternate2)
                                : const Icon(Icons.cloud_off_outlined,
                                    color: ColorPalette.alternate),
                      ),
                      //Boton de detalles
                      Expanded(
                        child: IconButton(
                          onPressed: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context_) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider(
                                                create: (_) =>
                                                    SaleDetailCubit()),
                                            BlocProvider(
                                                create: (_) =>
                                                    OptionsEditSaleCubit()),
                                          ],
                                          child: SaleDetailController(
                                              sale: elementList),
                                        ))).then((value) {
                              context
                                  .read<SalesViewCubit>()
                                  .load(SaleFormModel.empty());
                            });
                          },
                          icon: const Icon(
                            Icons.navigate_next,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
