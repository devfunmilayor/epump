import 'package:epump/app/theme.dart';
import 'package:epump/module/auth/viewModel/login_vm.dart';
import 'package:epump/module/dashboard/viewModel/dashboard_vm.dart';
import 'package:epump/module/dashboard/viewModel/drivers_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
  ChangeNotifierProvider(create: (_) => DriversVm()),
  ChangeNotifierProvider(create: (_) => DashBoarViewModel()),
];
