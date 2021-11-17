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
    print("showBottomSheetAnim 들어옴");
    if (bSelect.value == true) {
      bottomsheet_height.value = 0.3;
      print("내려가야 된다 ${bottomsheet_height.value}");
      bSelect.value = false;
      print("상태  ${bSelect.value}");
    } else {
      bottomsheet_height.value = 0.5;
      bSelect.value = true;
      print("올라가야 된다 ${bottomsheet_height.value}");
      print("상태  ${bSelect.value}");
    }
  }
}
