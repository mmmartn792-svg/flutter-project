// في ملف lib/widgets/custom_date_picker_field.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePickerField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final String? Function(String?)? validator;
  final void Function(DateTime) onDateSelected;

  const CustomDatePickerField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.validator,
    required this.onDateSelected,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2029),
    );

    if (pickedDate != null) {
      // عرض التاريخ للمستخدم بالصيغة المفضلة (dd/MM/yyyy)
      final displayDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      controller.text = displayDate;

      // إعادة كائن DateTime للوالد ليقوم بالتحويل المناسب للخادم
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    // استخدام ألوان من الثيم لدعم الوضع الليلي
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () => _selectDate(context),
        borderRadius: BorderRadius.circular(12.0),
        child: IgnorePointer(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              prefixIcon: Icon(prefixIcon, color: colorScheme.primary),
              // استخدام ألوان الثيم للحدود
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: colorScheme.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: colorScheme.outline),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
              ),
              filled: true,
              // استخدام لون الخلفية من الثيم
              fillColor: colorScheme.surface,
            ),
            validator: validator,
            style: TextStyle(
              fontSize: 16,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
        ),
      ),
    );
  }
}
