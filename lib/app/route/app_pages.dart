import 'package:get/get.dart';
import 'package:ifplant_app/app/root.dart';
import 'package:ifplant_app/app/ui/pages/plant_screen.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Root()),
    GetPage(name: Routes.PLANT, page: () => const PlantScreen()),
  ];
}
