import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static final shared = AppColors._();
  static final _colors = LightTheme();

  Color get white => _colors.white;
  Color get red => _colors.red;
  Color get blue => _colors.blue;
  Color get darkBlue => _colors.darkBlue;
  Color get startCell => _colors.startCell;
  Color get stepCell => _colors.stepCell;
  Color get blockCell => _colors.blockCell;
  Color get finishCell => _colors.finishCell;
}

abstract class IColor {
  late final Color white;
  late final Color red;
  late final Color blue;
  late final Color darkBlue;
  late final Color startCell;
  late final Color stepCell;
  late final Color blockCell;
  late final Color finishCell;
}

class LightTheme implements IColor {
  @override
  Color white = const Color(0xFFFFFFFF);

  @override
  Color red = const Color(0xFFE37171);

  @override
  Color blue = const Color(0xFF4A89FF);

  @override
  Color darkBlue = const Color(0xFF0056F8);

  @override
  Color startCell = const Color(0xFF64FFDA);

  @override
  Color stepCell = const Color(0xFF4CAF50);

  @override
  Color blockCell = const Color(0xFF000000);

  @override
  Color finishCell = const Color(0xFF009688);
}
