import 'package:epump/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/auth/view/login.dart';
import '../widget/form_label.dart';

class SPForm extends StatelessWidget {
  final String hintText;
  final TextStyle customTextHintStyle;
  final Widget prefixIcon;
  final TextInputType inputType;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onComplete;
  final ValueChanged<String> onEditing;
  final ValueChanged<String> onSubmitted;
  final bool isEnabled;
  final Widget suffixIcon;
  final String labelText;
  final int maxLen, maxLin;
  final double contentPadding;
  final Color textColor, hintColor;
  final bool autoCorrect, passwordVisible;
  final ValueChanged<String> onSaved;
  final Color borderColor;
  final List inputForm;
  final String initialValue;
  final FormFieldValidator<String> validateForm;
  final FocusNode hasFocus;
  final Function onTap;
  final bool readOnly;
  final dynamic controller;

  const SPForm(
      {Key key,
      this.hintText,
      this.customTextHintStyle,
      this.prefixIcon,
      this.inputType,
      this.onChanged,
      this.onComplete,
      this.onEditing,
      this.onSubmitted,
      this.isEnabled,
      this.suffixIcon,
      this.labelText,
      this.maxLen,
      this.maxLin,
      this.contentPadding,
      this.textColor,
      this.hintColor,
      this.autoCorrect,
      this.passwordVisible = false,
      this.onSaved,
      this.borderColor,
      this.inputForm,
      this.initialValue,
      this.validateForm,
      this.hasFocus,
      this.onTap,
      this.readOnly,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormLabel(
          label: labelText,
        ),
        TextFormField(
          onTap: onTap,
          readOnly: readOnly ?? false,
          initialValue: initialValue,
          obscureText: passwordVisible,
          onFieldSubmitted: onSubmitted,
          controller: controller,
          inputFormatters: inputForm,
          onSaved: onSaved,
          maxLines: maxLin,
          // maxLength: maxLen,
          autocorrect: true,
          focusNode: hasFocus,
          validator: validateForm,
          onChanged: onChanged,
          cursorHeight: 12,
          enabled: isEnabled,
          keyboardType: inputType,
          style: GoogleFonts.nunito(
              fontSize: 11.sp, color: textColor, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle: customTextHintStyle ??
                GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  //  color: textAndarrowColor,
                ),
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.symmetric(
                vertical: contentPadding ?? 25, horizontal: 20),
            counterText: '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 0.2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: textEnableColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff171717),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          // border: InputBorder.none,
        ),
      ],
    );
  }
}
