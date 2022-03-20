import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverContainer extends StatelessWidget {
  const DriverContainer({
    Key key,
    this.driverFullName,
    this.tokenId, this.onTap,
  }) : super(key: key);
  final String driverFullName, tokenId;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        // height: size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: ListTile(
          onTap: onTap,
          contentPadding: EdgeInsets.all(-0),
          leading: Container(
            height: size.height * 0.06,
            width: size.width * 0.13,
            decoration: BoxDecoration(
                color: Color(0xffF1F1F1),
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              PhosphorIcons.activity,
              color: Colors.black,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              tokenId ?? '[[38;5;231m5T14:44:57.000000Z","updated_at',
              style: GoogleFonts.nunito(
                  fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          title: Text(
            driverFullName ?? 'Funmi Tope',
            style: GoogleFonts.nunito(
                fontSize: 12.sp, fontWeight: FontWeight.w400),
          ),
        ));
  }
}
