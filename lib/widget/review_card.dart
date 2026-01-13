import 'package:flutter/material.dart';
import 'package:projectq/core/theme/app_colors.dart';
import 'package:projectq/core/theme/app_text_styles.dart';
import 'package:projectq/core/theme/app_spacing.dart';

class ReviewCard extends StatelessWidget {
  final String reviewerName;
  final String rating;
  final String reviewText;
  final String? date;

  const ReviewCard({
    super.key,
    required this.reviewerName,
    required this.rating,
    required this.reviewText,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSpacing.elevationLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(reviewerName, style: AppTextStyles.heading3),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: AppSpacing.iconSmall,
                      color: AppColors.iconGold,
                    ),
                    const SizedBox(width: AppSpacing.xs),

                    Text(" ${int.parse(rating)}", style: AppTextStyles.rating),
                  ],
                ),
              ],
            ),
            if (date != null) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(date!, style: AppTextStyles.bodySmall),
            ],
            const SizedBox(height: AppSpacing.sm),
            Text(reviewText, style: AppTextStyles.bodyMedium),
          ],
        ),
      ),
    );
  }
}
