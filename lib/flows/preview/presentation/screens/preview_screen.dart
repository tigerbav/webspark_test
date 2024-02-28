import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_constants.dart';
import 'package:webspark_test/common/widgets/custom_app_bar.dart';
import 'package:webspark_test/flows/preview/presentation/enums/cell_type.dart';
import 'package:webspark_test/flows/preview/presentation/widgets/grid_item.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';
import 'package:webspark_test/flows/process/data/models/resulting_data.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';

@RoutePage()
class PreviewScreen extends StatelessWidget {
  const PreviewScreen({
    super.key,
    required this.resultingData,
    required this.field,
  });
  final ResultingData resultingData;
  final List<List<String>> field;

  @override
  Widget build(BuildContext context) {
    final fieldInList = <String>[];

    for (final e in field) {
      fieldInList.addAll(e);
    }

    return Scaffold(
      appBar: CustomAppBar(LocaleKeys.preview_screen.tr(), context),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: fieldInList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: field.length,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final x = index % field.length;
          final y = index ~/ field.length;

          final currStep = Coordinate(x: x, y: y);
          final isBlock = fieldInList[index] == C.block;

          return GridItem(
            coordinate: currStep,
            cellType: CellTypeEx.defineType(
              steps: resultingData.result.steps,
              currStep: currStep,
              isBlock: isBlock,
            ),
            isBlock: isBlock,
          );
        },
      ),
    );
  }
}
