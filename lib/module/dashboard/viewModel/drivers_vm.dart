import 'dart:convert';

import 'package:epump/data/network.dart';
import 'package:epump/data/repository.dart';
import 'package:epump/model/drivers_resp.dart';
import 'package:epump/util/sharepref.dart';
import 'package:flutter/foundation.dart';

class DriversVm extends ChangeNotifier {
  final repository = Repository(networkService: NetworkService());
  final sharedPreferenceQS = SharedPreferenceQS();

  bool isLoaiding = false;
  DriversVm() {
    getAllDriver();
  }
  AllDrivers allDrivers;
  final bool loading = false;

  Future<void> getAllDriver() async {
    try {
      isLoaiding = true;
      final bankListRespData = await repository.getAllDriver();
      print('bankListRespData: $bankListRespData');

      allDrivers = AllDrivers.fromJson(jsonDecode(bankListRespData));
      if (kDebugMode) {
        print('allDrivers: $allDrivers');
      }
      notifyListeners();
    } catch (e) {
      isLoaiding = false;
      if (kDebugMode) {
        print('Error ${e.toString()}');
      }
    }
  }
}
