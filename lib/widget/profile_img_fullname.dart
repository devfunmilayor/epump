
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'upload_profile_image.dart';

class ProfileImgName extends StatelessWidget {
  const ProfileImgName({
    Key key,
    this.fullName,
    this.uploadImg,
    this.imgURL,
  }) : super(key: key);
  final String fullName, imgURL;
  final Function uploadImg;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.1,
      child: Row(children: [
        ProfieImageEdit(
          ingUrl: imgURL,
          uploadImg: uploadImg,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullName ?? 'Jane Doe',
                style: GoogleFonts.nunito(
                    fontSize: 25.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                margin: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xfff026AE),
                    )),
                child: Text(
                  'verified',
                  style: GoogleFonts.nunito(
                      fontSize: 10.sp, fontWeight: FontWeight.w300),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
