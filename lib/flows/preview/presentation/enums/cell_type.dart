import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_colors.dart';
import 'package:webspark_test/flows/process/data/models/coordinate.dart';

enum CellType { start, step, end, block, empty }

extension CellTypeEx on CellType {
  Color get color {
    switch (this) {
      case CellType.start:
        return AppColors.shared.startCell;
      case CellType.step:
        return AppColors.shared.stepCell;
      case CellType.end:
        return AppColors.shared.finishCell;
      case CellType.block:
        return AppColors.shared.blockCell;
      case CellType.empty:
        return AppColors.shared.white;
    }
  }

  static CellType defineType({
    required List<Coordinate> steps,
    required Coordinate currStep,
    required bool isBlock,
  }) {
    if (isBlock) {
      return CellType.block;
    } //
    else if (steps.first == currStep) {
      return CellType.start;
    } //
    else if (steps.last == currStep) {
      return CellType.end;
    } //
    else if (steps.contains(currStep)) {
      return CellType.step;
    } //

    return CellType.empty;
  }
}
