import 'dart:js';

import 'package:axol_rutas/views/sales_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../user/model/user.dart';
import '../../cubit/sales_cubit/sale_form_cubit.dart';
import '../../cubit/sales_cubit/sales_view_cubit.dart';
import '../../cubit/sales_cubit/sales_view_state.dart';
import '../../model/sale_form_model.dart';
import '../../repository/sale_repo_hive.dart';
import '../views/sales_view.dart';

class SalesViewController extends StatelessWidget {
  const SalesViewController({super.key});

  @override
  Widget build(BuildContext context) {
    //final supabase = Supabase.instance.client;
    return BlocConsumer<SalesViewCubit, SalesViewState>(
      bloc: context.read<SalesViewCubit>()..init(SaleFormModel.empty()),
      listener: (context, state) async {
        if (state is ErrorState) {
          final snackBar = SnackBar(content: Text(state.error));
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
          );
        } else if (state is LoadedState) {
          return SalesView(
            isLoading: false,
            user: state.user,
            listData: state.salesList,
          );
        } else {
          return SalesView(
            isLoading: false,
            user: UserModel.empty(),
            listData: const [],
          );
        }
      },
    );
  }
}
