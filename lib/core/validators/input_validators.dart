

class ValidationUtils {

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  static String? passwordValidator2(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    return null;
  }

    static String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

    static String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

    static String? userNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

    static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your otp';
    }
    return null;
  }
  
}
