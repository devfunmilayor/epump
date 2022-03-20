import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key key,
    this.cardName,
  }) : super(key: key);

  final String cardName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
     // width: size.width * 1,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.07),
            blurRadius: 4,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: const [
            Color(0xff2F2F2F),
            Color(0xff1F1F1F),
            Color(0xff171717),
            Color(0xff0D0D0D),
            Color(0xff0D0D0D),
            Color(0xff0D0D0D),
            Color(0xff0D0D0D),
            Color(0xff0D0D0D),
            Color(0xff0D0D0D),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Credit',
                style: GoogleFonts.nunito(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
                PhosphorIcons.cards_thin,
                size: 20,
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          ListTile(
            trailing: Text(
              '03/26',
              style: GoogleFonts.nunito(
                fontSize: 10.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            contentPadding: EdgeInsets.all(0),
            title: Text(
              cardName ?? '',
              style: GoogleFonts.nunito(
                fontSize: 11.sp,
                fontWeight: FontWeight.w300,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                '**** 456891',
                style: GoogleFonts.nunito(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
