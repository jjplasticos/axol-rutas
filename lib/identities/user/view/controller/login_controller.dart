// ignore_for_file: prefer_const_constructors

import 'package:axol_rutas/identities/user/view/pages/admin_page.dart';
import 'package:axol_rutas/identities/user/cubit/login/login/login_cubit.dart';
import 'package:axol_rutas/identities/user/cubit/login/login/login_state.dart';
import 'package:axol_rutas/identities/user/view/views/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sale/cubit/sales_cubit/sale_form_cubit.dart';
import '../../../sale/cubit/sales_cubit/sales_view_cubit.dart';
import '../../../sale/view/controllers/salesview_controller.dart';
import '../../../sale/view/views/sales_view.dart';
import '../../cubit/vendors_list/vendors_list_cubit.dart';
import 'vendorslist_controller.dart';

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: context.read<LoginCubit>()..load(),
      listener: (context, state) {
        if (state is FailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Usuario o contraseña invalida.')));
        } else if (state is SuccessState) {
          final rol = state.user.rol;
          if (rol == 'admin') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (_) => VendorsListCubit(),
                          child: VendorsListController(),
                        )));
          } else if (rol == 'vendor') {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider(create: (_) => SalesViewCubit()),
                            BlocProvider(create: (_) => SaleFormCubit()),
                          ],
                          child: SalesViewController(),
                        )));
          }
        } else if (state is ErrorState) {
          if (kDebugMode) {
            print('LoginErrorState: ${state.error}');
          }
        }
        if (state is TestState) {
          if (state.testNumber == 0) {
            final snackBar = SnackBar(content: Text(state.testText));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          // ignore: prefer_const_constructors
          return LoginView();
        } else if (state is LoadedState) {
          // ignore: prefer_const_constructors
          return LoginView();
        } else {
          // ignore: prefer_const_constructors
          return LoginView();
        }
      },
    );
  }
}
