import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keysmith/src/core/common/routes/app_router.dart';
import 'package:keysmith/src/core/common/services/service_locator/service_locator.dart';
import 'package:keysmith/src/features/home/presentation/states/cubits/secrets_list_cubit.dart';
import 'package:keysmith/src/features/home/presentation/views/secrets_list_view.dart';
import 'package:keysmith/src/features/home/presentation/widgets/action_button_widget.dart';
import 'package:keysmith/src/features/home/presentation/widgets/exp_fab_widget/exp_floating_button_widget.dart';

@RoutePage()
class SecretsPage extends StatelessWidget {
  const SecretsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("All Secrets")),
      floatingActionButton: ExpFloatingButtonWidget(
        children: [
          ActionButton(
            onPressed: () => context.router.push(const AddRoute()),
            icon: const Icon(Icons.key),
          ),
          //TODO: un-comment when notes module is implemented.

          // ActionButton(
          //   onPressed: () => log("note pressed"),
          //   icon: const Icon(Icons.note_outlined),
          // ),
          if (kDebugMode)
            ActionButton(
              icon: const Icon(Icons.computer_sharp),
              onPressed: () => sl.get<SecretsListCubit>().getAllSecrets(),
            ),
        ],
      ),
      body: BlocProvider.value(
        value: sl<SecretsListCubit>(),
        child: const SecretsListView(),
      ),
    );
  }
}
