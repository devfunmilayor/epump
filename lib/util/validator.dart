import 'package:flutter/foundation.dart';

import 'constants.dart';

class EmailValidator {
  static String validateEmail(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyEmailField;
      }
      // Regex for email validation
      RegExp regExp = RegExp(emailRegex);
      if (regExp.hasMatch(value)) {
        return null;
      }
      return invalidEmailField;
    } else {
      return null;
    }
  }
}

class PhoneNumberValidator {
  static String validatePhoneNumber(String value) {
    if (kDebugMode) {
      print(value);
    }
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
      if (value.length != 11) {
        return phoneNumberLengthError;
      }
      // Regex for phone number validation
      RegExp regExp = RegExp(phoneNumberRegex);
      if (kDebugMode) {
        print(regExp.hasMatch(value));
      }
      if (regExp.hasMatch(value)) {
        return null;
      }
      return invalidPhoneNumberField;
    } else {
      return null;
    }
  }
}

class PasswordValidator {
  static String _value;

  static bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  static String validatePassword(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }

      // if (!validateStructure(value)) {
      //   return "Please enter valid password. (Min. 1 upper case \nMin. 1 lowercase \nMin. 1 Numeric Number \nMinimum 1 Special Character( ! @ # \$ & * ~ )";
      // }
    } else {
      return null;
    }
    _value = value;
    return null;
  }

  static String validateLoginPassword(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value.length < 8) {
        return passwordLengthError;
      }
    } else {
      return null;
    }
    return null;
  }

  static String confirmPassword(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPasswordField;
      }

      if (value != _value) {
        return passwordMatchError;
      }
    } else {
      return null;
    }
    return null;
  }
}

class UsernameValidator {
  static String validateUsername(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUsernameField;
      }

      if (value.length < 6) {
        return usernameLengthError;
      }
    } else {
      return null;
    }

    return null;
  }
}

class FieldValidator {
  static String validate(String value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyTextField;
      }
    } else {
      return null;
    }

    return null;
  }
}
