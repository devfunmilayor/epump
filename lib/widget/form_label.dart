import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({
    Key key,
    this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Text(
        label,
        style: GoogleFonts.nunito(fontSize: 12.sp, fontWeight: FontWeight.w400),
      ),
    );
  }
}
