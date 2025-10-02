import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import 'core/constants/app_colors.dart';
import 'core/routes/routes.dart';


/// =======================================
/// Main Entry Point of the Application
/// =======================================

late final List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);


  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// 👇 Match your Figma/iPhone design reference size
      designSize: const Size(390, 844), // iPhone 13/14 reference
      minTextAdapt: true, // adapt text for small devices
      splitScreenMode: true, // handle tablets & split-screen
      builder: (_, __) {
        return GetMaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "MON5MAJEUR",

          /// ================= THEME =================
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backgroundColor,
            useMaterial3: true,
          ),

          /// ================= Device Preview =================
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,

          /// ================= Routing =================
          routeInformationParser: AppRouter.route.routeInformationParser,
          routerDelegate: AppRouter.route.routerDelegate,
          routeInformationProvider:
          AppRouter.route.routeInformationProvider,
        );
      },
    );
  }
}