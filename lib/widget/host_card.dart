import 'package:flutter/material.dart';
import 'package:projectq/core/theme/app_colors.dart';
import 'package:projectq/core/theme/app_text_styles.dart';
import 'package:projectq/core/theme/app_spacing.dart';

class HostCard extends StatelessWidget {
  final String hostName;
  final String hostType;
  final String hostingDuration;
  final Widget? avatar;

  const HostCard({
    super.key,
    required this.hostName,
    required this.hostType,
    required this.hostingDuration,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSpacing.elevationLow,
      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            avatar ??
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.accentBlue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: AppSpacing.iconLarge,
                  ),
                ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hosted by $hostName',
                    style: AppTextStyles.bodyLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '$hostType • $hostingDuration',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
