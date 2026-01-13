import 'package:flutter/material.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/core/theme/app_colors.dart';
import 'package:projectq/core/theme/app_text_styles.dart';
import 'package:projectq/core/theme/app_spacing.dart';
import 'package:projectq/generated/l10n.dart';

import 'package:projectq/models/showAllApartment_model.dart';
import 'package:projectq/screen/AllBookings.dart' show MyBookingsPage;

import 'package:projectq/screen/home.dart';
import 'package:projectq/widget/primary_button.dart';
import 'package:projectq/widget/secondary_button.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final ApartmentModel apartment;

  final String? checkInDate;
  final String? checkOutDate;

  const BookingConfirmationScreen({
    super.key,
    required this.apartment,

    this.checkInDate,
    this.checkOutDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 60),
              ),
              const SizedBox(height: AppSpacing.xl),
              // Title
              Text(
                S.of(context).bookingsw,
                style: AppTextStyles.heading1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              // Message
              Text(
                S.of(context).messagNot,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),
              // Booking Details Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusLarge),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).detailbooking,
                      style: AppTextStyles.heading2,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    // _buildDetailRow(
                    //   label: 'Confirmation',
                    //   value: Formatters.formatConfirmationNumber(
                    //     confirmationNumber,
                    //   ),
                    // ),
                    const SizedBox(height: AppSpacing.sm),
                    _buildDetailRow(
                      label: S.of(context).Property,
                      value: apartment.title,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SizedBox(height: 20),
                    _buildDetailRow(
                      label: S.of(context).Dates,
                      value: checkInDate! + "    " + checkOutDate!,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SizedBox(height: 20),
                    _buildDetailRow(
                      label: S.of(context).total,
                      value: apartment.price,
                      valueStyle: AppTextStyles.price.copyWith(
                        color: AppColors.accentBlue,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              PrimaryButton(
                text: S.of(context).View,
                icon: Icons.receipt_long,
                onPressed: () {
                  // Navigate to booking details
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => MyBookingsPage()),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                text: S.of(context).backHome,
                icon: Icons.home,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) =>
                          Home(role: CacheHelper().getData(key: ApiKey.role)),
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required String label,
    required String value,
    TextStyle? valueStyle,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$label:',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style:
              valueStyle ??
              AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
