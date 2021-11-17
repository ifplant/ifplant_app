import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/root.dart';
import 'package:ifplant_app/app/ui/android/select/select_plant.dart';

import 'package:ifplant_app/app/ui/android/select_detail/select_plant_detail.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Root()),
    GetPage(
        name: Routes.PLANT,
        arguments: 'hey',
        page: () => SelectPlant(Get.arguments)),
    GetPage(
        name: Routes.PLANTDETAIL, page: () => SelectPlantDetail(Get.arguments)),
  ];
}
