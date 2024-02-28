import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_colors.dart';

class AppStyles {
  static final shared = AppStyles._();

  AppStyles._()
      : appBarStyle = _appBarStyle,
        descriptionStyle = _descriptionStyle,
        btnStyle = _btnStyle,
        coordinateStyle = _coordinateStyle,
        coordinateStyleWhite =
            _coordinateStyle.copyWith(color: AppColors.shared.white);

  final TextStyle appBarStyle;
  final TextStyle descriptionStyle;
  final TextStyle btnStyle;
  final TextStyle coordinateStyle;
  final TextStyle coordinateStyleWhite;

  static final _appBarStyle = TextStyle(
    color: AppColors.shared.white,
    fontSize: 21,
    fontWeight: FontWeight.w800,
  );

  static final _descriptionStyle = TextStyle(
    color: AppColors.shared.blockCell,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static final _btnStyle = TextStyle(
    color: AppColors.shared.blockCell,
    fontSize: 12,
    fontWeight: FontWeight.w800,
  );

  static final _coordinateStyle = TextStyle(
    color: AppColors.shared.blockCell,
    fontSize: 21,
    fontWeight: FontWeight.w800,
  );
}
