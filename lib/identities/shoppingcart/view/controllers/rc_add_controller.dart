import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/customer_form/customer_formview_cubit.dart';
import '../../cubit/customer_form/customer_formview_state.dart';
import '../views/customer_add_view.dart';

class RcAddController extends StatelessWidget {
  const RcAddController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerFormviewCubit, CustomerFormviewState>(
        bloc: context.read<CustomerFormviewCubit>()..load(),
        builder: (context, state) {
          if (state is LoadingState) {
            return CustomerAddView();
          } else if (state is LoadedState) {
            return CustomerSelectView(rcList: state.rcList, isLoading: false,);
          } else if (state is ErrorState) {
            return Text(state.error, style: Typo.labelText1,);
          } else {
            return const Text('No accedio a algun estado', style: Typo.labelText1,);
          }
        });
  }
}