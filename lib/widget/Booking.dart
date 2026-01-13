import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/models/AllBookingsModel.dart';

class BookingCard extends StatelessWidget {
  final Booking booking;
  final VoidCallback onCancel;
  final VoidCallback onEdit;
  final VoidCallback AddRating;
  const BookingCard({
    Key? key,
    required this.booking,
    required this.onCancel,
    required this.onEdit,
    required this.AddRating,
  }) : super(key: key);

  // دالة مساعدة لإنشاء شريط الحالة بألوان مختلفة
  Widget _buildStatusChip(String status, String stauts1, context) {
    Color backgroundColor;
    Color textColor;
    String text;
    if (stauts1 == "none") {
      switch (status.toLowerCase()) {
        case 'pending':
          backgroundColor = Colors.orange.shade100;
          textColor = Colors.orange.shade800;
          text = S.of(context).inWiting;
          break;
        case 'ended':
          backgroundColor = Colors.pink.shade100;
          textColor = Colors.pink.shade800;
          text = S.of(context).end;
          break;
        case 'approved':
          backgroundColor = Colors.green.shade100;
          textColor = Colors.green.shade800;
          text = S.of(context).aproved;
          break;
        case 'cancelled':
          backgroundColor = Colors.red.shade100;
          textColor = Colors.red.shade800;
          text = S.of(context).disapproved;
          break;
        default:
          backgroundColor = Colors.grey.shade100;
          textColor = Colors.grey.shade800;
          text = status;
      }
    } else {
      switch (stauts1.toLowerCase()) {
        case 'pending':
          backgroundColor = Colors.orange.shade100;
          textColor = Colors.orange.shade800;
          text = S.of(context).inWiting;
          break;
        case 'ended':
          backgroundColor = Colors.pink.shade100;
          textColor = Colors.pink.shade800;
          text = S.of(context).end;
          break;
        case 'approved':
          backgroundColor = Colors.green.shade100;
          textColor = Colors.green.shade800;
          text = S.of(context).aproved;
          break;
        case 'cancelled':
          backgroundColor = Colors.red.shade100;
          textColor = Colors.red.shade800;
          text = S.of(context).disapproved;
          break;
        default:
          backgroundColor = Colors.grey.shade100;
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
    final apartment = booking.apartment;
    final formatter = DateFormat('MMM dd, yyyy');
    final dateRange =
        "${formatter.format(booking.startDate)} - ${formatter.format(booking.endDate)}";
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
                _buildStatusChip(booking.status, booking.modifyStatus, context),
              ],
            ),
            const SizedBox(height: 12),

            // تفاصيل الحجز
            _buildDetailRow(Icons.calendar_today, dateRange),
            _buildDetailRow(Icons.location_on, location),
            _buildDetailRow(
              Icons.attach_money,
              "${apartment.price} ${apartment.priceUnit}",
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (booking.status.toLowerCase() ==
                    'approved') // عرض زر التعديل فقط في حالة الانتظار
                  TextButton.icon(
                    onPressed: onEdit,
                    icon: Icon(Icons.edit, size: 18),
                    label: Text("تعديل"),
                    style: TextButton.styleFrom(foregroundColor: Colors.blue),
                  ),
                const SizedBox(width: 8),
                if (booking.status.toLowerCase() !=
                    'cancelled') // إخفاء زر الإلغاء إذا تم الإلغاء مسبقاً
                  TextButton.icon(
                    onPressed: onCancel,
                    icon: Icon(Icons.cancel_outlined, size: 18),
                    label: Text("إلغاء"),
                    style: TextButton.styleFrom(foregroundColor: Colors.red),
                  ),
                if (booking.status.toLowerCase() == 'approved')
                  TextButton.icon(
                    onPressed: AddRating,
                    icon: Icon(Icons.edit, size: 18),
                    label: Text("اضافة تقييم"),
                    style: TextButton.styleFrom(foregroundColor: Colors.green),
                  ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت مساعد لإنشاء صف من أيقونة ونص
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
