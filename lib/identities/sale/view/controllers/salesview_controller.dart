import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../cubit/sales_cubit/sales_view_cubit.dart';
import '../../cubit/sales_cubit/sales_view_state.dart';
import '../../model/sale_form_model.dart';
import '../views/sales_view.dart';

class SalesViewController extends StatelessWidget {
  const SalesViewController({super.key});

  @override
  Widget build(BuildContext context) {
    //final supabase = Supabase.instance.client;
    return BlocConsumer<SalesViewCubit, SalesViewState>(
      bloc: context.read<SalesViewCubit>()..load(SaleFormModel.empty()),
      listener: (context, state) async {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text('SalesViewController: ${state.error}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is InitialState) {
          context.read<SalesViewCubit>().load(SaleFormModel.empty());
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return SalesView(
            isLoading: true,
            user: UserModel.empty(),
            listData: const [],
            salesNotSync: 0,
          );
        } else if (state is LoadedState) {
          return SalesView(
            isLoading: false,
            user: state.user,
            listData: state.salesList,
            salesNotSync: state.nSaleNotSync,
          );
        } else {
          return SalesView(
            isLoading: false,
            user: UserModel.empty(),
            listData: const [],
            salesNotSync: 0,
          );
        }
      },
    );
  }
}
