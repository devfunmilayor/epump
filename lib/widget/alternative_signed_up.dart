import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignedupAlternative extends StatelessWidget {
  const SignedupAlternative({
    Key key,
    this.altSignedUp,
  }) : super(key: key);

  final Function altSignedUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: altSignedUp,
      child: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'Don\'t have an account? ',
                  style: GoogleFonts.nunito(
                      fontSize: 11.sp, fontWeight: FontWeight.w300)),
              TextSpan(
                text: 'Sign up',
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w600, fontSize: 11.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
