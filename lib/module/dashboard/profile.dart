import 'package:epump/model/login_resp.dart';
import 'package:epump/module/auth/viewModel/login_vm.dart';
import 'package:epump/widget/header_tag.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/profile_widget.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  static String routeName = "profile";

  @override
  Widget build(BuildContext context) {
    String userName, email, role, id;

    parseAuthData(LoginViewModel loginViewModel) {
      try {
        if (loginViewModel.userLoginTag != null) {
          final userData = UserLoginResp.fromJson(loginViewModel.userLoginTag);
          userName = userData.fullName ?? '';
          email = userData.email ?? '';
          role = userData.roles[0];
          id = userData.userId;
        }
      } catch (e) {
        if (kDebugMode) {
          print('Server Auth Error');
        }
      }
    }

    return Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
      parseAuthData(loginViewModel);
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
                  child: HeaderTag(
                    title: 'My Account',
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ),
              Expanded(
                child: AccountWid(
                  email: email,
                  userFullName: userName,
                  userId: id,
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      );
    });
  }
}
