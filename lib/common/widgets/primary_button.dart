import 'package:flutter/material.dart';
import 'package:webspark_test/common/app_colors.dart';
import 'package:webspark_test/common/app_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: AppColors.shared.darkBlue),
          color: AppColors.shared.blue,
        ),
        child: Text(
          title,
          style: AppStyles.shared.btnStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
