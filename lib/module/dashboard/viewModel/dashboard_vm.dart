import 'package:epump/model/login_resp.dart';
import 'package:epump/module/auth/viewModel/login_vm.dart';
import 'package:flutter/foundation.dart';

class DashBoarViewModel extends ChangeNotifier {
  final loginViewModel = LoginViewModel() ;
  // DashBoarViewModel() {
  //   parseAuthData(loginViewModel);
  // }

  String userName, email, role, id;

  parseAuthData(LoginViewModel loginViewModel) {
    try {
      if (loginViewModel.userLoginTag != null) {
        final userData = UserLoginResp.fromJson(loginViewModel.userLoginTag);
        userName = userData.fullName ?? '';
        email = userData.email ?? '';
        role = userData.roles[0] ?? '';
        id = userData.userId ?? '';
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Server Auth Error');
      }
    }
  }
}
