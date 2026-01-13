import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/models/AllBookingOwnerModele.dart';

class MyApartmentsPage extends StatefulWidget {
  const MyApartmentsPage({Key? key}) : super(key: key);

  @override
  _MyApartmentsPageState createState() => _MyApartmentsPageState();
}

class _MyApartmentsPageState extends State<MyApartmentsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserCubit>().AllOwnerBookings();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myApartments),
        centerTitle: true,
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is AproveModifySuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.modifiedBookingDetails.message)),
            );
          } else if (state is AproveBookingSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is rejectSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.modifiedBookingDetails.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is AllOwnerBookingLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AllOwnerBookingSuccess) {
            if (state.bookingResponse.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.apartment,
                      size: 80,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).noApartments,
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
              onRefresh: () async =>
                  context.read<UserCubit>().AllOwnerBookings(),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.bookingResponse.data.length,
                itemBuilder: (context, index) {
                  final apartment = state.bookingResponse.data[index];
                  return ApartmentBookingsCard(apartment: apartment);
                },
              ),
            );
          }

          if (state is AllOwnerBookingFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: Colors.red.shade400,
                  ),
                  SizedBox(height: 16),
                  Text(S.of(context).eror),
                  SizedBox(height: 8),
                  Text(state.errMessage, textAlign: TextAlign.center),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<UserCubit>().AllOwnerBookings(),
                    child: Text(S.of(context).refresh),
                  ),
                ],
              ),
            );
          }

          return Center(child: Text(S.of(context).loadings));
        },
      ),
    );
  }
}

class ApartmentBookingsCard extends StatelessWidget {
  final OwnerApartment apartment;

  const ApartmentBookingsCard({Key? key, required this.apartment})
    : super(key: key);

  Widget _buildStatusChip(BuildContext context, String status, String status1) {
    Color backgroundColor;
    Color textColor;
    String text;
    if (status1 == "none") {
      switch (status.toLowerCase()) {
        case 'approved':
          backgroundColor = Colors.green.shade100;
          textColor = Colors.green.shade800;
          text = S.of(context).aproved;
          break;
        case 'ended':
          backgroundColor = Colors.pink.shade100;
          textColor = Colors.pink.shade800;
          text = S.of(context).end;
          break;
        case 'pending':
          backgroundColor = Colors.orange.shade100;
          textColor = Colors.orange.shade800;
          text = S.of(context).inWiting;
          break;
        case 'rejected':
          backgroundColor = Colors.red.shade100;
          textColor = Colors.red.shade800;
          text = S.of(context).disapproved;
          break;
        default:
          backgroundColor = Colors.grey.shade200;
          textColor = Colors.grey.shade800;
          text = status;
      }
    } else {
      switch (status1.toLowerCase()) {
        case 'approved':
          backgroundColor = Colors.green.shade100;
          textColor = Colors.green.shade800;
          text = S.of(context).aproved;
          break;
        case 'ended':
          backgroundColor = Colors.pink.shade100;
          textColor = Colors.pink.shade800;
          text = S.of(context).end;
          break;
        case 'pending':
          backgroundColor = Colors.orange.shade100;
          textColor = Colors.orange.shade800;
          text = S.of(context).inWiting;
          break;
        case 'rejected':
          backgroundColor = Colors.red.shade100;
          textColor = Colors.red.shade800;
          text = S.of(context).disapproved;
          break;
        default:
          backgroundColor = Colors.grey.shade200;
          textColor = Colors.grey.shade800;
          text = status;
      }
    }

    return Chip(
      label: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat('MMM dd, yyyy');
    final location = "${apartment.city.name}, ${apartment.city.province.name}";

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    apartment.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _buildStatusChip(context, apartment.status, apartment.status),
              ],
            ),
            const SizedBox(height: 12),
            _buildDetailRow(
              Icons.attach_money,
              "${apartment.price} ${apartment.priceUnit} / ${apartment.priceType}",
            ),
            _buildDetailRow(Icons.location_on, location),
            _buildDetailRow(
              Icons.square_foot,
              "${apartment.area} ${apartment.areaUnit}",
            ),
            const SizedBox(height: 16),

            Text(
              S.of(context).bookingsForApartment,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            if (apartment.bookings.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  S.of(context).noBookings,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              )
            else
              Column(
                children: apartment.bookings.map((booking) {
                  final renterName =
                      "${booking.user.firstName} ${booking.user.lastName}";
                  final dateRange =
                      "${formatter.format(booking.startDate)} - ${formatter.format(booking.endDate)}";
                  return Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              renterName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            _buildStatusChip(
                              context,
                              booking.status,
                              booking.modifyStatus,
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          dateRange,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (booking.modifyStatus == 'pending') ...[
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<UserCubit>().aproveModifyOwner(
                                    id1: booking.id,
                                  );
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MyApartmentsPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Text(S.of(context).ok),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<UserCubit>().rejectbook(
                                    id1: booking.id,
                                  );
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MyApartmentsPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: Text(S.of(context).disagree),
                              ),
                            ] else if (booking.status == 'pending') ...[
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<UserCubit>().aproveBookingOwner(
                                    id1: booking.id,
                                  );
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MyApartmentsPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: Text(S.of(context).ok),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: Colors.grey.shade800, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}
