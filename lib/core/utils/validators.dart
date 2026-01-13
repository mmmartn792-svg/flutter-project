class Validators {
  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Phone validation
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // Card number validation
  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Card number is required';
    }
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length < 13 || digits.length > 19) {
      return 'Please enter a valid card number';
    }
    // Luhn algorithm check
    if (!_luhnCheck(digits)) {
      return 'Please enter a valid card number';
    }
    return null;
  }

  // Expiry date validation
  static String? validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Expiry date is required';
    }
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 4) {
      return 'Please enter MM/YY';
    }
    final month = int.tryParse(digits.substring(0, 2));
    final year = int.tryParse(digits.substring(2, 4));
    
    if (month == null || month < 1 || month > 12) {
      return 'Invalid month';
    }
    
    final now = DateTime.now();
    final currentYear = now.year % 100;
    if (year == null || year < currentYear) {
      return 'Card has expired';
    }
    
    return null;
  }

  // CVV validation
  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty) {
      return 'CVV is required';
    }
    if (value.length < 3 || value.length > 4) {
      return 'Please enter a valid CVV';
    }
    return null;
  }

  // Cardholder name validation
  static String? validateCardholderName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Cardholder name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  // Required field validation
  static String? validateRequired(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Luhn algorithm for card validation
  static bool _luhnCheck(String cardNumber) {
    int sum = 0;
    bool alternate = false;
    
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int digit = int.parse(cardNumber[i]);
      
      if (alternate) {
        digit *= 2;
        if (digit > 9) {
          digit = (digit % 10) + 1;
        }
      }
      
      sum += digit;
      alternate = !alternate;
    }
    
    return sum % 10 == 0;
  }
}

