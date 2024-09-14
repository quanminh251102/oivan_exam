import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oivan_exam/global/locator.dart';
import 'package:oivan_exam/global/providers.dart';
import 'package:provider/provider.dart';

import 'global/router.dart';
import 'ui/utils/navigation_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  configLoading();
  await setupLocator();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 500)
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.black
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.black
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiProvider(
        providers: [...viewModelProviders],
        child: GetMaterialApp(
          builder: EasyLoading.init(),
          title: 'OivanStack',
          navigatorKey: NavigationUtils.navigatorKey,
          onGenerateRoute: (settings) => MyRouter.generateRoute(settings),
          initialRoute: MyRouter.splash,
          theme: ThemeData(
            checkboxTheme: CheckboxThemeData(
              side: WidgetStateBorderSide.resolveWith(
                (states) => const BorderSide(
                  width: 1.0,
                  color: Color(
                    0xffD3D3D3,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
              ),
              checkColor: WidgetStateProperty.all(
                const Color(
                  0xffFFFFFF,
                ),
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
        ));
  }
}
