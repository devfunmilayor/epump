import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMore extends StatelessWidget {
  const ViewMore({
    Key key,
    this.onTap,
  }) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Transaction',
            style: GoogleFonts.nunito(
                fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
          Text(
            'View more',
            style: GoogleFonts.nunito(
                fontSize: 10.sp, fontWeight: FontWeight.w200),
          ),
        ],
      ),
    );
  }
}
