import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_styles.dart';
import 'package:webspark_test/flows/process/presentation/logic/process_cubit.dart';
import 'package:webspark_test/services/navigation/app_router.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({
    super.key,
    required this.state,
    required this.index,
  });

  final ProcessState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    final resultingData = state.resultingData[index];

    return GestureDetector(
      onTap: () => context.router.push(PreviewRoute(
        resultingData: resultingData,
        field: state.field(resultingData.id),
      )),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          resultingData.result.path,
          textAlign: TextAlign.center,
          style: AppStyles.shared.coordinateStyle,
        ),
      ),
    );
  }
}
