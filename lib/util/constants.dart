import 'package:flutter/material.dart';

const kAnimationDuration = Duration(milliseconds: 200);

const String emptyEmailField = "Email field cannot be empty!";
const String emptyTextField = "Field cannot be empty!";
const String emptyPasswordField = "Password field cannot be empty";
const String passwordMatchError = 'Password mismatch';
const String invalidEmailField =
    "Email provided isn\'t valid.Try another email address";
const String passwordLengthError = "Password length must be greater than 6";
const String emptyUsernameField = "Username  cannot be empty";
const String usernameLengthError = "Username length must be greater than 6";
const String emailRegex = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}"
        "\\@"
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
        "("
        "\\." +
    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
    ")+";

const String phoneNumberRegex = r"0[789][01]\d{8}";

const String phoneNumberLengthError = "Phone number must be 11 digits";

const String invalidPhoneNumberField =
    "Number provided isn\'t valid.Try another phone number";
const Color textEnableColor = Color(0xffBB22A6);
