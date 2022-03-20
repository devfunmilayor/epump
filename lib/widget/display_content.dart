import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayContent extends StatelessWidget {
  const DisplayContent({
    Key key,
    this.title,
    this.subtitle,
    this.edit,
    this.editText,
  }) : super(key: key);

  final String title, subtitle, editText;
  final Function edit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title ?? 'Display Name',
        style: GoogleFonts.nunito(
          fontSize: 9.sp,
          fontWeight: FontWeight.w200,
        ),
      ),
      subtitle: Text(
        subtitle ?? 'Jane Doe',
        style: GoogleFonts.nunito(fontSize: 13.sp, fontWeight: FontWeight.w800),
      ),
      trailing: InkWell(
        onTap: edit,
        child: Container(
          // alignment: Alignment.center,
          // width: size.width * 0.1,
          margin: EdgeInsets.only(top: 28),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          decoration: BoxDecoration(
            // border: Border.all(
            //   color:
            // ),

            color: Color(0xff414052),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            editText ?? 'Edit',
            textAlign: TextAlign.center,
            style:
                GoogleFonts.nunito(fontSize: 9.sp, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
