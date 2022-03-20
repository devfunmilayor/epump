import 'dart:io';

import 'package:epump/data/log.dart';
import 'package:epump/model/drivers_resp.dart';
import 'package:epump/util/sharepref.dart';
import 'package:flutter/foundation.dart';

import '../model/login_req.dart';
import 'api.dart';

class NetworkService {
  final apiManager = ApiManager();
  final sharedPreferenceQS = SharedPreferenceQS();
  Future<dynamic> signIn(UserLogin userLogin) async {
    if (kDebugMode) {
      print('UserReqNetwork: ${userLogin.password}');
    }
    var url = 'Login';
    Map<String, dynamic> responseJson;
    try {
      final response = await apiManager.post(url, userLogin);
      if (kDebugMode) {
        print('ServerData $response');
      }
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  // Future<AllDrivers> getAllDrivers() async {
  //   var companyId =
  //       await sharedPreferenceQS.getSharedPrefs(String, 'companyId') ?? '';
  //   bool count = true;
  //   var url = 'Drivers/All?count=$count&companyId=$companyId';
  //   try {
  //     final response = await apiManager.get(url);

  //     return AllDrivers.fromJson(response);

  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }

  Future<dynamic> getAllDrivers() async {
    var companyId =
        await sharedPreferenceQS.getSharedPrefs(String, 'companyId') ?? '';
    bool count = true;
    var url = 'Drivers/All?count=$count&companyId=$companyId';
    try {
      final response = await apiManager.customGet(url);

      print('responseDatavar : ${response.toString()}');

      // print('response: ${allDriversFromJson(response.toString())}');
      return response;
      // print('companyId : $companyId');
      // print('url: $url');
      // // print('resp: ${apiManager.get(url)}');
      // print('response: ${response.toString()}');
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }
}
