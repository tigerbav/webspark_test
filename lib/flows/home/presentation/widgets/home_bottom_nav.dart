import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test/common/widgets/primary_button.dart';
import 'package:webspark_test/flows/home/presentation/logic/home_cubit.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      title: LocaleKeys.start_counting_process.tr(),
      onTap: context.read<HomeCubit>().checkLink,
    );
  }
}
