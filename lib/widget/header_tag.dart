import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderTag extends StatelessWidget {
  const HeaderTag({
    Key key,
    this.onTap,
    this.title,
  }) : super(key: key);
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkResponse(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          hoverColor: Colors.grey.withOpacity(0.1),
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.05,
            width: size.width * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.4))),
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.07,
        ),
        Text(
          title ?? '',
          style: GoogleFonts.nunito(
              fontSize: 25.sp,
             // color: Colors.white,
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
