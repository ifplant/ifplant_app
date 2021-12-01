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
    var status = await Permission.storage.status;

    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
      ].request();
    }
  }
}
