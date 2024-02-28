import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/common/app_styles.dart';
import 'package:webspark_test/common/utils/utils.dart';
import 'package:webspark_test/common/widgets/custom_app_bar.dart';

import 'package:webspark_test/flows/home/presentation/logic/home_cubit.dart';
import 'package:webspark_test/flows/home/presentation/widgets/home_bottom_nav.dart';
import 'package:webspark_test/flows/home/presentation/widgets/link_widget.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';
import 'package:webspark_test/services/navigation/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        switch (state.status) {
          case HomeStatus.success:
            final link = context.read<HomeCubit>().state.link;
            context.router.push(ProcessRoute(link: link));
          case HomeStatus.failure:
            Utils.showSnackBar(context, state.errorMessage);
          default:
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(LocaleKeys.home_screen.tr(), null),
        bottomNavigationBar: const HomeBottomNav(),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              LocaleKeys.set_valid_api.tr(),
              style: AppStyles.shared.descriptionStyle,
            ),
            const SizedBox(height: 8),
            const LinkWidget(),
          ],
        ),
      ),
    );
  }
}
