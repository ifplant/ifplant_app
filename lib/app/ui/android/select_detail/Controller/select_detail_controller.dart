import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDetailController extends GetxController {
  static SelectDetailController get to => Get.find();

  late RxDouble bottomsheet_height = 0.0.obs;
  late RxBool bSelect = false.obs;
  @override
  onInit() {
    super.onInit();
    print("SelectDetail: OnInit");
    bottomsheet_height = 0.5.obs;
  }

  showBottomSheetAnim() {
    if (bSelect.value == true) {
      print("${bottomsheet_height.value}");
      bottomsheet_height.value = 0.3;
      print("${bottomsheet_height.value}");
    } else {
      bottomsheet_height.value = 0.5;
      bSelect = false.obs;
    }
  }
}
