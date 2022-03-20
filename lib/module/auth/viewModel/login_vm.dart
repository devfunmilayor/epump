import 'package:epump/data/network.dart';
import 'package:epump/model/login_req.dart';
import 'package:epump/model/login_resp.dart';
import 'package:epump/module/dashboard/dashboard_main.dart';
import 'package:epump/util/custom_snack.dart';
import 'package:epump/util/sharepref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../data/repository.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel() {
    retrieveData();
  }
  String message;
  bool error;
  bool isValidEmail = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _sharedPreferenceQS = SharedPreferenceQS();
  bool isVisiblePassword = false;
  Repository repository = Repository(networkService: NetworkService());
  bool _isLoading = false;
  String email;
  bool get isLoading => _isLoading;

  Map _userLogin = {};

  Map get userLoginTag => _userLogin;

  retrieveData() async {
    String email =
        await _sharedPreferenceQS.getSharedPrefs(String, 'email') ?? '';
    if (kDebugMode) {
      print('email: $email');
    }
    emailController.text = email;
    notifyListeners();
  }

  isLoadingData(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  validateEmail(value) {
    isValidEmail = value;
    notifyListeners();
  }

  visiblePassword() {
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
  }

  Future<dynamic> loginUser(UserLogin userLogin, BuildContext context) async {
    try {
      isLoadingData(true);
      _userLogin = await repository.userSignIn(userLogin);
      if (userLoginTag != null) {
        isLoadingData(false);
        final loginResp = UserLoginResp.fromJson(userLoginTag);
        notifyListeners();

        if (loginResp.isActive == true) {
          _sharedPreferenceQS.setData('String', 'token', loginResp.token);
          _sharedPreferenceQS.setData('String', 'email', loginResp.email);

          _sharedPreferenceQS.setData(
              'String', 'companyId', loginResp.developer.id);

          Navigator.of(context).pushReplacementNamed(DashBoardMain.routeName);
        } else {
          showTopSnackBar(
              context,
              CustomSnackBar.error(
                message: 'Invalid Credential',
              ));
        }
      } else {
        isLoadingData(false);
        showTopSnackBar(
            context,
            CustomSnackBar.error(
              message: 'Error Fetching Data',
            ));
      }
    } catch (e) {
      isLoadingData(false);
    }
    notifyListeners();
  }
}
