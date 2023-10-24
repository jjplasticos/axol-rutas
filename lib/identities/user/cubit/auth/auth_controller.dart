import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../sale/cubit/sales_cubit/sale_form_cubit.dart';
import '../../../sale/cubit/sales_cubit/sales_view_cubit.dart';
import '../../../sale/repository/sale_repo_hive.dart';
import '../../../sale/repository/sales_repo.dart';
import '../../../sale/view/controllers/salesview_controller.dart';
import '../../../sale/view/views/sales_view.dart';
import '../../view/controller/login_controller.dart';
import '../../view/controller/vendorslist_controller.dart';
import '../../view/pages/admin_page.dart';
import '../../view/views/splash_view.dart';
import '../login/login/login_cubit.dart';
import '../login/login_form_cubit.dart';
import '../vendors_list/vendors_list_cubit.dart';
import 'auth_cubit.dart';
import 'auth_state.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      bloc: BlocProvider.of<AuthCubit>(context)..getUserState(),
      builder: (BuildContext context, AuthState state) {
        if (state is AuthLoadingState) {
          return const SplashView();
        } else if (state is AuthAuthenticatedState) {
          final rol = state.user.rol;
          if (rol == 'admin') {
            //DatabaseSales().initRealTime(state.user);
            //SaleRepoHive().initBoxes(state.user);
            return BlocProvider(
              create: (_) => VendorsListCubit(),
              // ignore: prefer_const_constructors
              child: VendorsListController(),
            );
          } else if (rol == 'vendor') {
            DatabaseSales().initRealTime(state.user);
            SaleRepoHive().initBoxes(state.user);
            // ignore: prefer_const_constructors
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => SalesViewCubit()),
                BlocProvider(create: (_) => SaleFormCubit()),
              ],
              // ignore: prefer_const_constructors
              child: SalesViewController(),
            );
          } else {
            return const Text('Error: no entro a ni una pagina.');
          }
        } else if (state is AuthUnuauthenticatedState) {
          return Center(
              child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => LoginFormCubit()),
              BlocProvider(create: (_) => LoginCubit())
            ],
            child: LoginController(),
          )
              //LoginPage()
              );
        } else if (state is AuthErrorState) {
          return Center(
            child: Text(state.toString()),
          );
        } else {
          return const Center(
            child: Text('Error: no se recibió estado.'),
          );
        }
      },
    );
  }
}
