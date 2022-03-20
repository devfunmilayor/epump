import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpGradeUI extends StatelessWidget {
  const UpGradeUI({
    Key key,
    this.tier,
    this.upGrade,
  }) : super(key: key);

  final String tier;
  final Function upGrade;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 18),
      decoration: BoxDecoration(
        color: Color(0xff21212B).withOpacity(0.4),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: ListTile(
        subtitle: Text(
          tier ?? 'Tier 1',
          overflow: TextOverflow.ellipsis,
          style:
              GoogleFonts.nunito(fontSize: 13.sp, fontWeight: FontWeight.w800),
        ),
        title: Text(
          'Level',
          style:
              GoogleFonts.nunito(fontSize: 9.sp, fontWeight: FontWeight.w200),
        ),
        trailing: InkWell(
          onTap: upGrade,
          child: Container(
            margin: EdgeInsets.only(top: 28),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xffB817DA),
                  Color(0xffC51FC1),
                  Color(0xfff026AE)
                ],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Upgrade to Tier 2',
              style: GoogleFonts.nunito(
                  fontSize: 10.sp, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
