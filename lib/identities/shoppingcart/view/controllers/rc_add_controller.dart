import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/customer_form/customer_formview_cubit.dart';
import '../../cubit/customer_form/customer_formview_state.dart';
import '../views/customer_add_view.dart';

class RcAddController extends StatelessWidget {
  const RcAddController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerFormviewCubit, CustomerFormviewState>(
        bloc: context.read<CustomerFormviewCubit>()..load(),
        listener: (context, state) {
          if (state is ErrorState) {
            final snackBar = SnackBar(content: Text(state.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            // ignore: prefer_const_constructors
            return CustomerAddView(
              vendor: '',
              isLoading: true,
            );
          } else if (state is LoadedState) {
            return CustomerAddView(
              vendor: state.vendor,
              isLoading: false,
            );
          } else {
            // ignore: prefer_const_constructors
            return CustomerAddView(vendor: '', isLoading: false);
          }
        });
  }
}
