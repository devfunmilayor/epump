import 'package:epump/data/network.dart';
// import 'package:epump/model/drivers_resp.dart';
import 'package:epump/model/login_req.dart';

class Repository {
  final NetworkService networkService;

  Repository({this.networkService});

  Future<dynamic> userSignIn(UserLogin userLogin) async {
    final apiCall = await networkService?.signIn(userLogin);
    return apiCall;
  }

  Future<dynamic> getAllDriver() async {
    final apiCall = await networkService?.getAllDrivers();
    // print('apicall: $apiCall');
    return apiCall;
  }
}
