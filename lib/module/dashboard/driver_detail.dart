import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custom_divider.dart';
import '../../widget/profile_header.dart';

class DriversDetail extends StatelessWidget {
  const DriversDetail({Key key}) : super(key: key);
  static String routeName = "driverDetail";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 0,
            child: Column(
              children: [
                DriverHeaderDetails(
                  fullName: 'Jade Park Lauren',
                  role: 'Driver',
                  company: 'Indiana Carshore',
                  location:
                      'Indiana Jones , Ajayi Crowther , Ajalayi Lagos State.',
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                CustomDivider(size: size),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Vehicles',
                    style: GoogleFonts.nunito(
                        fontSize: 30.sp, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
