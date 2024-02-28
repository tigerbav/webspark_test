import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_colors.dart';
import 'package:webspark_test/common/app_styles.dart';
import 'package:webspark_test/flows/preview/presentation/enums/cell_type.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    super.key,
    required this.coordinate,
    required this.cellType,
    required this.isBlock,
  });

  final Coordinate coordinate;
  final CellType cellType;
  final bool isBlock;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.shared.blockCell),
        color: cellType.color,
      ),
      alignment: Alignment.center,
      child: Text(
        coordinate.toString(),
        style: isBlock
            ? AppStyles.shared.coordinateStyleWhite
            : AppStyles.shared.coordinateStyle,
      ),
    );
  }
}
