class Formatters {
  // Format currency
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return '$symbol${amount.toStringAsFixed(0)}';
  }

  // Format phone number
  static String formatPhoneNumber(String phone) {
    // Remove all non-digit characters
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    
    // Format based on length
    if (digits.length == 10) {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    } else if (digits.length == 11) {
      return '${digits.substring(0, 4)} ${digits.substring(4, 7)} ${digits.substring(7)}';
    }
    return phone;
  }

  // Format card number (add spaces)
  static String formatCardNumber(String cardNumber) {
    final digits = cardNumber.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }

  // Format expiry date (MM/YY)
  static String formatExpiryDate(String date) {
    final digits = date.replaceAll(RegExp(r'\D'), '');
    if (digits.length >= 2) {
      final month = digits.substring(0, 2);
      final year = digits.length >= 4 ? digits.substring(2, 4) : '';
      return year.isNotEmpty ? '$month/$year' : month;
    }
    return date;
  }

  // Format date range
  static String formatDateRange(DateTime start, DateTime end) {
    final startStr = '${start.month}/${start.day}/${start.year}';
    final endStr = '${end.month}/${end.day}/${end.year}';
    return '$startStr - $endStr';
  }

  // Format confirmation number
  static String formatConfirmationNumber(String number) {
    return '#$number';
  }
}

