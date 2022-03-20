import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function handler;
  final bool invert;
  final Color btnColor;
  final isUSingIcon;
  final double textSize;
  List<Color> gradientColors;
  Color borderColor;
  Color fontColor;
  double fontSize;
  FontWeight fontWeight;

  RoundedButton(
      {this.text,
      this.handler,
      this.invert = false,
      this.btnColor = const Color.fromRGBO(52, 209, 134, 1),
      this.textSize = 20,
      this.gradientColors = const [
        Color(0xffB817DA),
        Color(0xff101010),
        Color(0xff101010)
      ],
      this.isUSingIcon = false,
      this.borderColor = Colors.transparent,
      this.fontColor = Colors.white,
      this.fontWeight = FontWeight.w600,
      this.fontSize});
  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;

    //fontSize = fontSize != null ? fontSize : settings.bodyText4;
    return Container(
      height: dimension.height * 0.075,
      decoration: BoxDecoration(
        // ignore: prefer_is_empty
        gradient: gradientColors.length > 0
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors,
                stops: const [0.0, 0.7])
            : null,
        border: Border.all(
          width: 1.3,
          color: btnColor,
        ),
        color: invert ? Colors.transparent : btnColor,
        borderRadius: BorderRadius.circular(7),
      ),
      //margin: EdgeInsets.fromLTRB(30, 5, 30, 5),
      child: ButtonTheme(
        minWidth: double.infinity,
        // ignore: deprecated_member_use
        child: FlatButton(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side:
                  BorderSide(color: invert ? Colors.white : Colors.transparent),
            ),
            child: Padding(
                padding: EdgeInsets.all(2),
                child: !isUSingIcon
                    ? Text(
                        text,
                        style: TextStyle(
                          fontWeight: fontWeight,
                          fontSize: fontSize,
                        ),
                      )
                    : SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: invert ? Colors.white : Colors.white,
                          valueColor: AlwaysStoppedAnimation(
                              Color.fromRGBO(52, 209, 134, 1)),
                        ),
                      )),
            onPressed: () {
              handler();
            }),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.btnLabel,
    this.btnTap,
    this.isUSingIcon = false,
  }) : super(key: key);
  final String btnLabel;
  final Function btnTap;
  final bool isUSingIcon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: btnTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.07,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: const [
                Color(0xffB817DA),
                Color(0xffC51FC1),
                Color(0xfff026AE)
              ],
            )),
        child: !isUSingIcon
            ? Text(
                btnLabel ?? '',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 11.sp, fontWeight: FontWeight.w400),
              )
            : Container(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor:
                      AlwaysStoppedAnimation(Color.fromRGBO(52, 209, 134, 1)),
                ),
              ),
      ),
    );
  }
}
