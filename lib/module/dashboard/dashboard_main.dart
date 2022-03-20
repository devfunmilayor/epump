import 'package:epump/model/login_resp.dart';
import 'package:epump/module/auth/viewModel/login_vm.dart';
import 'package:epump/module/dashboard/viewModel/dashboard_vm.dart';
import 'package:epump/util/time_zone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../widget/dashboard_header_img.dart';
import 'dpage_view.dart';
import 'drivers_ui.dart';

enum _Tab { one, two }

class DashBoardMain extends StatefulWidget {
  static String routeName = "dashBoard";

  const DashBoardMain({Key key}) : super(key: key);

  @override
  State<DashBoardMain> createState() => _DashBoardMainState();
}

class _DashBoardMainState extends State<DashBoardMain> {
  _Tab _selectedTab = _Tab.one;
  bool initialized = false;
  final greeting = TimeZONEE();
  String greetingMes = '';

  @override
  void initState() {
    greetingMes = greeting.greetingMessage();
    super.initState();
  }

  String userName;
  parseAuthData(LoginViewModel loginViewModel) {
    try {
      if (loginViewModel.userLoginTag != null) {
        final userData = UserLoginResp.fromJson(loginViewModel.userLoginTag);
        userName = userData.fullName ?? '';
      }
    } catch (e) {
      if (kDebugMode) {
        print('Server Auth Error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
      parseAuthData(loginViewModel);
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
          child: ListView(
            scrollDirection: Axis.vertical,
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderCircularDash(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Text(
                '$greetingMes,\n$userName',
                style: GoogleFonts.nunito(
                    fontSize: 30.sp, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.06,
                child: CupertinoSlidingSegmentedControl<_Tab>(
                    backgroundColor: Colors.transparent,
                    padding: EdgeInsets.only(right: 120, left: 0),
                    children: {
                      _Tab.one: Text(
                        'Daily Overview',
                        style: GoogleFonts.nunito(
                            fontSize: 10.sp, fontWeight: FontWeight.w300),
                      ),
                      _Tab.two: Text(
                        'Drivers',
                        style: GoogleFonts.nunito(
                            fontSize: 10.sp, fontWeight: FontWeight.w300),
                      ),
                      // _Tab.three: Text(
                      //   'Product Category',
                      //   style: GoogleFonts.poppins(
                      //       fontSize: 10.sp, fontWeight: FontWeight.w300),
                      // ),
                    },
                    groupValue: _selectedTab,
                    onValueChanged: (val) {
                      setState(() {
                        _selectedTab = val;
                      });
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Builder(
                  // ignore: missing_return
                  builder: (context) {
                    switch (_selectedTab) {
                      case _Tab.one:
                        return DPage();
                      case _Tab.two:
                        return DriversUI();

                        break;
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
