import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/models/AllBookingsModel.dart';
import 'package:projectq/screen/home.dart';
import 'package:projectq/screen/modifyBooking.dart';
import 'package:projectq/screen/rating_page.dart';
import 'package:projectq/widget/Booking.dart';

class MyBookingsPage extends StatefulWidget {
  const MyBookingsPage({Key? key}) : super(key: key);

  @override
  _MyBookingsPageState createState() => _MyBookingsPageState();
}

class _MyBookingsPageState extends State<MyBookingsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().AllBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).MyBookings),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    Home(role: CacheHelper().getData(key: ApiKey.role)),
              ),
            );
          },
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is CancelBookingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              
              ),
            );
            context.read<UserCubit>().AllBookings();
          } else if (state is CancelBookingtFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AllBookingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AllBookingSuccess) {
            if (state.bookingResponse.data == null ||
                state.bookingResponse!.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.book_online_outlined,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).noBookings,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async => context.read<UserCubit>().AllBookings(),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.bookingResponse!.data.length,
                itemBuilder: (context, index) {
                  final booking = state.bookingResponse!.data[index];
                  return BookingCard(
                    AddRating: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              RatingPage(apartmentId: booking.apartmentId),
                        ),
                      );
                    },
                    booking: booking,
                    onCancel: () =>
                        _showCancelConfirmation(context, booking.id),
                    onEdit: () => _showEditOptions(context, booking),
                  );
                },
              ),
            );
          }

          if (state is AllBookingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(S.of(context).errorinBookings),
                  const SizedBox(height: 8),
                  Text(state.errMessage, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.read<UserCubit>().AllBookings(),
                    child: Text(S.of(context).again),
                  ),
                ],
              ),
            );
          }

          return Center(child: Text(S.of(context).loading));
        },
      ),
    );
  }

  void _showCancelConfirmation(BuildContext context, int bookingId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).confirmcancel),
        content: Text(S.of(context).confirmtt),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(S.of(context).backed),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();

              context.read<UserCubit>().cancelBooking(id1: bookingId);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(S.of(context).canceleBookings),
          ),
        ],
      ),
    );
  }

  void _showEditOptions(BuildContext context, Booking booking) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit_calendar),
              title: Text(S.of(context).modifyDate),
              onTap: () {
                Navigator.of(ctx).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Modifybooking(apartment: booking, id: booking.id),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
