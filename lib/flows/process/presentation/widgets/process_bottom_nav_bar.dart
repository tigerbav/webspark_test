import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/common/widgets/primary_button.dart';
import 'package:webspark_test/flows/process/presentation/logic/process_cubit.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';
import 'package:webspark_test/services/navigation/app_router.dart';

class ProcessBottomNavBar extends StatelessWidget {
  const ProcessBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProcessCubit, ProcessState>(
      buildWhen: (p, c) =>
          p.isLoading != c.isLoading || p.isFailure != c.isFailure,
      builder: (context, state) {
        if (state.isLoading || state.isFailure) return const SizedBox();

        return PrimaryButton(
          title: LocaleKeys.send_results_to_server.tr(),
          onTap: () {
            context.read<ProcessCubit>().sendResultToServer();
            context.router.push(ResultListRoute(state: state));
          },
        );
      },
    );
  }
}
