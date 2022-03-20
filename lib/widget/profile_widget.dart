import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'display_content.dart';
import 'profile_img_fullname.dart';
import 'secondary_btn.dart';
import 'upgrade_ui.dart';
import 'upload_profile_image.dart';

class AccountWid extends StatelessWidget {
  const AccountWid({
    Key key,
    this.userFullName,
    this.email,
    this.role,
    this.userId,
  }) : super(key: key);

  final String userFullName, email, role, userId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding:
          const EdgeInsets.only(top: 45.0, bottom: 20, left: 30, right: 30),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ProfileImgName(
            fullName: userFullName,
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 18),
            // height: size.height * 0.25,
            // width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff21212B).withOpacity(0.4),
            ),
            child: Column(
              children: [
                DisplayContent(
                  edit: () {},
                  subtitle: userFullName ?? 'Jane Doe',
                  title: 'Display Name',
                ),
                DisplayContent(
                  edit: () {},
                  subtitle: email ?? 'JaneDoe@hotmail.com',
                  title: 'Email',
                ),
                DisplayContent(
                  edit: () {},
                  editText: 'Change',
                  subtitle: '********',
                  title: 'Password',
                ),
              ],
            ),
          ),
          UpGradeUI(
            tier: userId ?? 'Tier 1',
            upGrade: () {},
          ),
          Container(
            // margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 18),
            decoration: BoxDecoration(
              color: Color(0xff272732).withOpacity(0.4),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Set the Tier 2 Profile',
                  style: GoogleFonts.nunito(
                      fontSize: 10.5.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  width: size.height * 0.02,
                ),
                Icon(
                  Icons.arrow_forward,
                  size: 15,
                  color: Color(0xff78787E),
                )
              ],
            ),
          ),
          SecondaryButton()
        ],
      ),
    );
  }
}
