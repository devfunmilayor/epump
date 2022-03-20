import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BalanceCurrent extends StatelessWidget {
  const BalanceCurrent({
    Key key,
    this.currentBalance,
  }) : super(key: key);

  final String currentBalance;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(-1),
      subtitle: Text(
        'NGN $currentBalance',
        style: GoogleFonts.nunito(
          fontWeight: FontWeight.w700,
          fontSize: 30.sp,
        ),
      ),
      title: Text(
        'Current Balance',
        style: GoogleFonts.nunito(fontSize: 9.sp, fontWeight: FontWeight.w200),
      ),
    );
  }
}
