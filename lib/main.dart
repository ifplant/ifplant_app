import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:ifplant_app/app/binding/init_binding.dart';
import 'package:ifplant_app/app/route/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const IfPlantApp());
}

class IfPlantApp extends StatelessWidget {
  const IfPlantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IfPlant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
