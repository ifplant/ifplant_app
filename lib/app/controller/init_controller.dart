import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:permission_handler/permission_handler.dart';

class InitController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _requestPermission();
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    Get.snackbar(
      "Permission Grant",
      info,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: primaryColor.withOpacity(0.3),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
}
