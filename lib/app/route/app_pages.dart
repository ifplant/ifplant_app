import 'package:get/get.dart';
import 'package:ifplant_app/app/root.dart';
import 'package:ifplant_app/app/ui/android/captured_page/captured_page.dart';
import 'package:ifplant_app/app/ui/android/select/select_plant.dart';

import 'package:ifplant_app/app/ui/android/select_detail/select_plant_detail.dart';
import 'package:ifplant_app/app/ui/android/splash_screen/splash_screen.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.INITIAL,
      page: () => const Root(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.PLANTLIST,
      page: () => const SelectPlant(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.PLANTDETAIL,
      page: () => const SelectPlantDetail(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.CAPTURED_PAGE,
      page: () => const CapturedPage(),
      transition: Transition.fade,
    ),
  ];
}
