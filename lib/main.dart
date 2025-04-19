import 'package:final_project/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'binding/initial_bindings.dart';
import 'core/const_data/routes.dart';
import 'core/service/my_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true, 
      splitScreenMode: true, 
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          initialBinding: InitialBindings(), 
          getPages: routes, 
          initialRoute: Routes.splashScreen, 
  //         theme: ThemeData(
  //   scaffoldBackgroundColor: Colors.white,
  // ),
        
        );
      },
    );
  }
}
