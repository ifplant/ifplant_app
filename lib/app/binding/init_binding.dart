import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/database_controller.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), permanent: true);
    Get.put(DataBaseController(), permanent: true);
  }
}
