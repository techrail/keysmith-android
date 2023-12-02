import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keysmith/src/core/common/services/service_locator/service_locator.dart';
import 'package:keysmith/src/features/add/presentation/states/add_password_cubit.dart';
import 'package:keysmith/src/features/add/presentation/views/add_password_view.dart';

@RoutePage()
class AddPage extends StatelessWidget {
  static const routeName = "/add";
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddPasswordCubit>(),
      child: const AddPasswordView(),
    );
  }
}
