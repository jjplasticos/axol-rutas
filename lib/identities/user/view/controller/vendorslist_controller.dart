import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sale/cubit/sales_cubit/sale_form_cubit.dart';
import '../../../sale/cubit/sales_cubit/sales_view_cubit.dart';
import '../../../sale/view/controllers/salesview_controller.dart';
import '../../cubit/vendors_list/vendors_list_cubit.dart';
import '../../cubit/vendors_list/vendors_list_state.dart';
import '../views/vendors_list_view.dart';

class VendorsListController extends StatelessWidget {
  const VendorsListController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VendorsListCubit, VendorsListState>(
      bloc: context.read<VendorsListCubit>()..load(),
      listenWhen: (previous, current) {
        print('listWhen: ${previous.toString()}');
        print('listWhen: ${current.toString()}');
        return true;
      },
      listener: (context, state) {
        print('flag0');
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is NextView) {
          if (state.status == true) {
            print('flag 1');
            Navigator.push(
                context,
                MaterialPageRoute(
                    // ignore: prefer_const_constructors
                    builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider(create: (_) => SalesViewCubit()),
                            BlocProvider(create: (_) => SaleFormCubit()),
                          ],
                          // ignore: prefer_const_constructors
                          child: SalesViewController(),
                        )));
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          // ignore: prefer_const_constructors
          return VendorsListView(
            isLoading: true,
            listData: const [],
          );
        } else if (state is LoadedState) {
          // ignore: prefer_const_constructors
          return VendorsListView(
            isLoading: false,
            listData: state.vendors,
          );
        } else {
          // ignore: prefer_const_constructors
          return VendorsListView(
            isLoading: false,
            listData: const [],
          );
        }
      },
    );
  }
}
