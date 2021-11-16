import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ifplant_app/app/binding/init_binding.dart';
import 'package:ifplant_app/app/route/app_pages.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const IfPlantApp());
}

class IfPlantApp extends StatelessWidget {
  const IfPlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IfPlant App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: backgroundColor),
        primaryColor: backgroundColor,
        canvasColor: backgroundColor,
      ),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
