import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/core/theme/app_colors.dart';
import 'package:projectq/core/theme/app_spacing.dart';
import 'package:projectq/core/theme/app_text_styles.dart' show AppTextStyles;
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/models/showAllApartment_model.dart';
import 'package:projectq/screen/booking.dart';
import 'package:projectq/screen/showRatingForApartment.dart';
import 'package:projectq/widget/host_card.dart';
import 'package:projectq/widget/image_carousel.dart';
import 'package:projectq/widget/primary_button.dart';
import 'package:projectq/widget/review_card.dart';

class Apartmentdetailspage extends StatefulWidget {
  final ApartmentModel apartment;
  const Apartmentdetailspage({super.key, required this.apartment});

  @override
  State<Apartmentdetailspage> createState() => _ApartmentdetailspageState();
}

class _ApartmentdetailspageState extends State<Apartmentdetailspage> {
  bool isFavorite = true;

  late final List<Map<String, dynamic>> _reviews = [
    {
      'name': S.of(context).name,
      'rating': '5',
      'text': S.of(context).text,
      'date': S.of(context).date11,
    },
  ];

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Text(title, style: AppTextStyles.heading2),
    );
  }

  Widget _buildInfoCard({required Widget child, required String title}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.heading3.copyWith(
                color: AppColors.accentOrange,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 20),
          const SizedBox(width: AppSpacing.md),
          Expanded(child: Text(text, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is FavorirsSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.favorit.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(widget.apartment.title)),
          body: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // Image Carousel
                  SliverToBoxAdapter(
                    child: ImageCarousel(
                      images: widget.apartment.images.isNotEmpty
                          ? widget.apartment.images
                          : [
                              'https://tse2.mm.bing.net/th/id/OIP.IVCR8jomTSjqUOJGJ-HybQHaE7?w=2000&h=1333&rs=1&pid=ImgDetMain&o=7&rm=3',
                            ],
                      height: 350,
                      onBack: () => Navigator.of(context).pop(),
                      onFavorite: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        context.read<UserCubit>().favorites(
                          id1: widget.apartment.idApartment,
                        );
                      },
                      isFavorite: isFavorite,
                    ),
                  ),
                  // Content
                  SliverPadding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Text(
                          widget.apartment.title,
                          style: AppTextStyles.heading1,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: AppSpacing.iconSmall,
                              color: AppColors.accentOrange,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              '${widget.apartment.province} - ${widget.apartment.city}',
                              style: AppTextStyles.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        // Host Card
                        HostCard(
                          hostName: 'Sarah',
                          hostType: 'Superhost',
                          hostingDuration: '3 years hosting',
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        _buildSectionTitle(S.of(context).About),
                        Text(
                          S.of(context).About1 +
                              '  ${widget.apartment.city}   ' +
                              S.of(context).About2,
                          style: AppTextStyles.bodyLarge,
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        _buildInfoCard(
                          title: S.of(context).public,
                          child: Column(
                            children: [
                              _buildDetailRow(
                                icon: Icons.apartment,
                                text:
                                    S.of(context).numberapa +
                                    ' ${widget.apartment.idApartment}',
                              ),
                              _buildDetailRow(
                                icon: Icons.phone,
                                text: widget.apartment.phone,
                              ),
                              _buildDetailRow(
                                icon: Icons.landscape,
                                text:
                                    S.of(context).area +
                                    ' ${widget.apartment.area}',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        _buildSectionTitle(S.of(context).whatAmen),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 4,
                                crossAxisSpacing: AppSpacing.md,
                                mainAxisSpacing: AppSpacing.md,
                              ),
                          itemCount: widget.apartment.amenities.length,
                          itemBuilder: (context, index) {
                            final amenity = widget.apartment.amenities[index];
                            return Chip(
                              label: Text(amenity),
                              backgroundColor: Colors.green.shade100,
                              side: BorderSide(color: Colors.green.shade300),
                              labelStyle: TextStyle(
                                color: Colors.green.shade800,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: AppSpacing.lg),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSectionTitle(S.of(context).rever),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ShowAllRating(
                                      apartmentid: widget.apartment.idApartment,
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                S.of(context).All,
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.accentBlue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        // Review Cards
                        ..._reviews.map(
                          (review) => Padding(
                            padding: EdgeInsets.only(bottom: AppSpacing.md),
                            child: ReviewCard(
                              reviewerName: review['name'],
                              rating: review['rating'],
                              reviewText: review['text'],
                              date: review['date'],
                            ),
                          ),
                        ),
                        const SizedBox(height: 120),
                      ]),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '\$${widget.apartment.price}',
                            style: AppTextStyles.price,
                          ),
                          Text('/ night', style: AppTextStyles.bodySmall),
                        ],
                      ),
                      SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: PrimaryButton(
                          text: S.of(context).bookNow,
                          icon: Icons.calendar_today,
                          onPressed: () {
                            if (CacheHelper().getData(key: ApiKey.role) ==
                                "renter") {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Booking(
                                    apartment: widget.apartment,
                                    id: widget.apartment.idApartment,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(S.of(context).rent)),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
