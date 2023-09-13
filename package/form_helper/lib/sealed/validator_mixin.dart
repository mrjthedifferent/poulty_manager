mixin FormHelperFieldValidatorMixin {
  String? validate(String? value);

  String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateMinLength(String? value, int min) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < min) {
      return 'This field must be at least $min characters';
    }
    return null;
  }

  String? validateMaxLength(String? value, int max) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length > max) {
      return 'This field must be less than $max characters';
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 11) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (DateTime.tryParse(value) == null) {
      return 'Please enter a valid date';
    }
    return null;
  }
}
