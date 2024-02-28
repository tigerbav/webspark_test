import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_colors.dart';
import 'package:webspark_test/common/app_styles.dart';

class CustomAppBar extends AppBar {
  CustomAppBar(String title, BuildContext? context, {super.key})
      : super(
          title: Text(title, style: AppStyles.shared.appBarStyle),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.shared.white,
            ),
            onPressed: context?.router.pop,
          ),
          centerTitle: false,
          backgroundColor: AppColors.shared.blue,
        );
}
