import 'package:epump/model/driver_props.dart';
import 'package:epump/widget/driver_wid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'driver_detail.dart';
import 'viewModel/drivers_vm.dart';

class DriversUI extends StatefulWidget {
  const DriversUI({
    Key key,
  }) : super(key: key);

  @override
  State<DriversUI> createState() => _DriversUIState();
}

class _DriversUIState extends State<DriversUI> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DriversVm>(builder: (context, driversVm, child) {
      return Column(
        children: DriversData()
            .driversData
            .asMap()
            .entries
            .map((e) => DriverContainer(
                  onTap: () {
                    Navigator.pushNamed(context, DriversDetail.routeName);
                  },
                  driverFullName: e.value.fullName,
                  tokenId: e.value.userId,
                ))
            .toList(),
      );
    });
  }
}
