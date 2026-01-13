import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/core/theme/app_text_styles.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/widget/review_card.dart';

class ShowAllRating extends StatefulWidget {
  const ShowAllRating({super.key, required this.apartmentid});
  final int apartmentid;

  @override
  State<ShowAllRating> createState() => _ShowAllRatingState();
}

class _ShowAllRatingState extends State<ShowAllRating> {
  late final List<Map<String, dynamic>> _reviews = [
    {
      'name': S.of(context).name,
      'rating': 4,
      'text': S.of(context).text,
      'date': S.of(context).date11,
    },
  ];

  List<String> name = ["Hassn", "Fars", "Amjd", "MAjd", "Mohanad"];

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().ShowAllrating(id: widget.apartmentid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
        title: Text(
          S.of(context).rever,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ShowRatingloading) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 96, 181, 63),
                ),
              ),
            );
          }

          if (state is ShowRatingSuccess) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(24),
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              S.of(context).rever,
                              style: AppTextStyles.heading2.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3F51B5).withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        _calculateAverageRating(
                                          state.ratingResponse.data,
                                        ).toStringAsFixed(1),
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF3F51B5),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(
                                          5,
                                          (index) => Icon(
                                            index <
                                                    _calculateAverageRating(
                                                      state.ratingResponse.data,
                                                    ).round()
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.amber,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${state.ratingResponse.data.length}" +
                                            "  ${S.of(context).reviews}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        S.of(context).basedOn,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          S.of(context).whatPeopleSay,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final item = state.ratingResponse.data[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: ReviewCard(
                          reviewerName: index < name.length
                              ? name[index]
                              : item.user,
                          rating: item.rating,
                          reviewText: item.comment,
                          date: _reviews[0]['date'],
                        ),
                      );
                    }, childCount: state.ratingResponse.data.length),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.error_outline,
                    size: 60,
                    color: Colors.red.shade400,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  S.of(context).noApartment,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.of(context).again,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => context.read<UserCubit>().ShowAllrating(
                    id: widget.apartmentid,
                  ),
                  icon: Icon(Icons.refresh),
                  label: Text(S.of(context).refresh),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF3F51B5),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  double _calculateAverageRating(List<dynamic> ratings) {
    if (ratings.isEmpty) return 0.0;

    double sum = 0.0;
    for (var rating in ratings) {
      sum += double.tryParse(rating.rating.toString()) ?? 0.0;
    }
    return sum / ratings.length;
  }
}
