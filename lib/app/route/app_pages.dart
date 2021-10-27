import 'package:get/get.dart';
import 'package:ifplant_app/app/root.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page: () => const Root()),
  ];
}
