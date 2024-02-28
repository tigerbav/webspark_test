import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_colors.dart';
import 'package:webspark_test/common/app_styles.dart';
import 'package:webspark_test/generated/locale_keys.g.dart';

class Utils {
  static void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.shared.red,
        content: Text(
          message ?? LocaleKeys.something_went_wrong.tr(),
          style: AppStyles.shared.descriptionStyle,
        ),
      ),
    );
  }
}
