import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key key,
    this.onTap,
    this.txtLabel,
  }) : super(key: key);

  final Function onTap;
  final String txtLabel;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(left: 10, top: 22, right: 10, bottom: 22),
          // height: size.height * 0.25,
          // width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xff21212B).withOpacity(0.4),
          ),
          child: Text(
            txtLabel ?? 'Signed Out',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                fontSize: 11.sp, fontWeight: FontWeight.w700),
          )),
    );
  }
}
