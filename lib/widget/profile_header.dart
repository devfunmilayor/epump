import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverHeaderDetails extends StatelessWidget {
  const DriverHeaderDetails({
    Key key,
    this.fullName,
    this.role,
    this.company,
    this.location,
  }) : super(key: key);
  final String fullName, role, company, location;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: size.height * 0.15,
              width: size.width * 0.2,
              //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              //padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  border: Border.all(
                    color: Color.fromARGB(255, 31, 15, 34),
                  )),
            ),
            Text(
              fullName ?? '',
              style: GoogleFonts.nunito(
                  fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  '$role at ',
                  style: GoogleFonts.nunito(
                      fontSize: 11.sp, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  company ?? '',
                  style: GoogleFonts.nunito(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Icon(
                  Icons.email,
                  size: 10,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  'Dev.Funmi@gmail.com',
                  style: GoogleFonts.nunito(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 10,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  '090296029384',
                  style: GoogleFonts.nunito(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 10,
                ),
                SizedBox(
                  width: size.width * 0.01,
                ),
                Text(
                  location ?? '',
                  style: GoogleFonts.nunito(
                      fontSize: 11.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        SizedBox()
      ],
    );
  }
}
