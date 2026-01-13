import 'package:flutter/material.dart';
import 'package:projectq/core/theme/app_colors.dart';
import 'package:projectq/core/theme/app_text_styles.dart';
import 'package:projectq/core/theme/app_spacing.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? width;
  final Color? borderColor;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.width,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: borderColor ?? AppColors.buttonPrimary,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: borderColor ?? AppColors.buttonPrimary,
                size: AppSpacing.iconMedium,
              ),
              const SizedBox(width: AppSpacing.sm),
            ],
            Text(
              text,
              style: AppTextStyles.buttonLarge.copyWith(
                color: borderColor ?? AppColors.buttonPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

