import 'package:epump/app/locator.dart';
import 'package:epump/app/theme.dart';
import 'package:epump/module/auth/view/login.dart';
import 'package:epump/module/dashboard/driver_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' as device;

import 'module/dashboard/dashboard_main.dart';
import 'module/dashboard/profile.dart';

Future<void> main() async {
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();

  await device.SystemChrome.setPreferredOrientations(
      [device.DeviceOrientation.portraitUp]);
  await device.SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [device.SystemUiOverlay.bottom]);
  device.SystemChrome.setSystemUIOverlayStyle(
      device.SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MultiProvider(
        providers: allProviders,
        child: App(),
      ),
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
    );
  }
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    // theme.setDarkMode();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        //theme: ThemeData(),
        // darkTheme: ThemeData.dark(),
        darkTheme: theme.darkTheme,
        themeMode: ThemeMode.system,
        routes: {
          DashBoardMain.routeName: (ctx) => DashBoardMain(),
          Profile.routeName: (ctx) => Profile(),
          DriversDetail.routeName: (ctx) => DriversDetail()
        },
        home: Login());
  }
}
