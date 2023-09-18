// ignore_for_file: non_constant_identifier_names

import 'package:axol_rutas/identities/sale/cubit/options_edit_sale/options_edit_sale_cubit.dart';
import 'package:axol_rutas/identities/sale/model/sale_model.dart';
import 'package:axol_rutas/identities/sale/view/controllers/sale_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../settings/format.dart';
import '../../../../../settings/theme.dart';
import '../../../../shoppingcart/cubit/shoppingcart/shppc_cubit.dart';
import '../../../../user/model/user.dart';
import '../../../cubit/sale_detail/sale_detail_cubit.dart';
import '../../../cubit/sales_list/saleslist_cubit.dart';
import '../../views/sale_details_view.dart';

class ListViewSales extends StatelessWidget {
  final List<SaleModel> listData;
  final String lbl_QUANTITY = 'Cantidad';
  final String lbl_WEIGHT_UNIT = 'kg';
  final String lbl_WEIGHT = 'Peso total';
  final String lbl_PRICE = 'Precio total';

  const ListViewSales({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listData.length,
      itemBuilder: ((context, index) {
        final elementList = listData[index];
        final DateTime time =
            DateTime.fromMillisecondsSinceEpoch(int.parse(elementList.time));
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
          child: Container(
            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
                color: ColorPalette.secondaryBackground,
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: ColorPalette.secondaryBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                          )),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8, 8, 0, 0),
                            child: Text(
                              elementList.client.toString(),
                              style: Typo.bodyText1,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 4, 0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}',
                                    //FormatDate.dmy(elementList.time.toString()),
                                    style: Typo.bodyText2,
                                  ),
                                  Text(
                                    elementList.uid.toString().split('-').first,
                                    style: Typo.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context_) =>
                                    MultiBlocProvider(
                                      providers: [
                                        BlocProvider(create: (_) => SaleDetailCubit()),
                                        BlocProvider(create: (_) => OptionsEditSaleCubit()),
                                        //BlocProvider(create: (_) => ShppcCubit()),
                                      ] ,
                                      child: SaleDetailController(sale: elementList),
                                      )
                                    //SaleDetailsView(sale: elementList),
                              )).then((value) {
                            context.read<SalesListCubit>().getSalesList('');
                          });
                        },
                        icon: const Icon(
                          Icons.navigate_next,
                          size: 30,
                        ))
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.24,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: ColorPalette.secondaryBackground,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: ColorPalette.secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                FormatNumber.decimal(double.parse(
                                    elementList.totalWeight.toString())),
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.38,
                      height: 80,
                      decoration: const BoxDecoration(
                        color: ColorPalette.secondaryBackground,
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
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
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
