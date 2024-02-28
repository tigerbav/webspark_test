import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/common/app_styles.dart';
import 'package:webspark_test/common/utils/utils.dart';
import 'package:webspark_test/common/widgets/custom_app_bar.dart';
import 'package:webspark_test/flows/process/data/datasources/process_datasource.dart';
import 'package:webspark_test/flows/process/domain/repository/process_repository.dart';
import 'package:webspark_test/flows/process/presentation/logic/process_cubit.dart';
import 'package:webspark_test/flows/process/presentation/widgets/process_bottom_nav_bar.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';

@RoutePage()
class ProcessScreen extends StatelessWidget {
  const ProcessScreen({
    super.key,
    required this.link,
  });

  final String link;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProcessCubit(
        repository: ProcessRepository(ProcessDataSource()),
        link: link,
      ),
      child: const _ProcessView(),
    );
  }
}

class _ProcessView extends StatelessWidget {
  const _ProcessView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProcessCubit, ProcessState>(
      listener: (context, state) {
        switch (state.status) {
          case ProcessStatus.failure:
            Utils.showSnackBar(context, state.errorMessage);
          case ProcessStatus.success:
          default:
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(LocaleKeys.process_screen.tr(), context),
        bottomNavigationBar: const ProcessBottomNavBar(),
        body: BlocBuilder<ProcessCubit, ProcessState>(
          buildWhen: (p, c) => p.isLoading != c.isLoading,
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.isLoading
                      ? ''
                      : LocaleKeys.calculation_has_finished.tr(),
                  textAlign: TextAlign.center,
                  style: AppStyles.shared.descriptionStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  '0%',
                  textAlign: TextAlign.center,
                  style: AppStyles.shared.descriptionStyle,
                ),
                const Divider(),
                const CircularProgressIndicator(value: 0),
              ],
            );
          },
        ),
      ),
    );
  }
}
