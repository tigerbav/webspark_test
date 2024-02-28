import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/common/widgets/custom_app_bar.dart';
import 'package:webspark_test/flows/process/presentation/logic/process_cubit.dart';
import 'package:webspark_test/flows/result_list/presentation/widgets/result_item.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';

@RoutePage()
class ResultListScreen extends StatelessWidget {
  const ResultListScreen({super.key, required this.state});
  final ProcessState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(LocaleKeys.result_list_screen.tr(), context),
      body: ListView.separated(
        itemCount: state.resultingData.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) => ResultItem(
          state: state,
          index: index,
        ),
      ),
    );
  }
}
