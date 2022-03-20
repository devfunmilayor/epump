import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../module/dashboard/profile.dart';

class HeaderCircularDash extends StatelessWidget {
  const HeaderCircularDash({
    Key key,
    this.checkProfile,
  }) : super(key: key);

  final Function checkProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Dashboard ',
          style:
              GoogleFonts.nunito(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        OpenContainer(
            openColor: Colors.transparent,
            closedColor: Colors.transparent,
            closedShape: CircleBorder(),
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: Duration(milliseconds: 900),
            // closedColor: ,
            openBuilder: (context, index) => Profile(),
            closedBuilder: (context, VoidCallback openContainer) =>
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.34),
                ))
      ],
    );
  }
}
