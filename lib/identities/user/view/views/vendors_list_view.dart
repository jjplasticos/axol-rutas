import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../globals/global_widgets/appbar/appbar_global.dart';
import '../../../../globals/global_widgets/appbar/iconbutton_return.dart';
import '../../../../settings/theme.dart';
import '../../../sale/cubit/sales_cubit/sale_form_cubit.dart';
import '../../../sale/cubit/sales_cubit/sales_view_cubit.dart';
import '../../../sale/repository/sale_repo_hive.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../../sale/view/controllers/salesview_controller.dart';
import '../../../sale/view/views/sales_view.dart';
import '../../cubit/vendors_list/vendors_list_cubit.dart';
import '../../model/user.dart';
import '../../repository/user_repo.dart';

class VendorsListView extends StatelessWidget {
  final bool isLoading;
  final List<UserModel> listData;

  const VendorsListView(
      {super.key, required this.isLoading, required this.listData});

  @override
  Widget build(BuildContext context) {
    const String title = 'Vendedores';

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => VendorsListCubit()),
      ],
      child: Scaffold(
          backgroundColor: ColorPalette.primaryBackground,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarGlobal(title: title, actions: []),
          ),
          body: Column(
            children: [
              Visibility(
                  visible: isLoading,
                  replacement: const SizedBox(
                    height: 4,
                  ),
                  child: const LinearProgressIndicator(
                    color: ColorPalette.primary,
                    backgroundColor: ColorPalette.secondaryBackground,
                  )),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shrinkWrap: true,
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    final vendor = listData[index];
                    return OutlinedButton(
                        onPressed: () {
                          if (isLoading == false) {
                            LocalUser().setLocalVendor(vendor.name, vendor.id);
                            DatabaseSales().initRealTime(vendor);
                            SaleRepoHive().adminInitBox(vendor);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // ignore: prefer_const_constructors
                                    builder: (context) => MultiBlocProvider(
                                          providers: [
                                            BlocProvider(
                                                create: (_) =>
                                                    SalesViewCubit()),
                                            BlocProvider(
                                                create: (_) => SaleFormCubit()),
                                          ],
                                          // ignore: prefer_const_constructors
                                          child: SalesViewController(),
                                        )));
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                              color: ColorPalette.secondaryBackground,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(vendor.name, style: Typo.bodyText6),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: ColorPalette.secondaryText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                ),
              ),
            ],
          )

          //bottomNavigationBar: const NavigationBarGlobal(currentIndex: 0),
          ),
    );
  }
}
