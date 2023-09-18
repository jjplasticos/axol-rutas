import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/model/user.dart';
import '../../cubit/sales_cubit/sales_view_cubit.dart';
import '../../cubit/sales_cubit/sales_view_state.dart';
import '../views/sales_view.dart';

class SalesViewController extends StatelessWidget {

  const SalesViewController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SalesViewCubit, SalesViewState>(
      bloc: context.read<SalesViewCubit>()..load(),
      listener: (context, state) {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return SalesView(
            isLoading: true,
            localVendor: UserModel.empty(),
          );
        } else if (state is LoadedState) {
          return SalesView(
            isLoading: false,
            localVendor: state.vendor,
          );
        } else {
          return SalesView(isLoading: false, localVendor: UserModel.empty());
        }
      },
    );
  }
}