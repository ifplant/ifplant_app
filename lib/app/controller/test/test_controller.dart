import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TestController extends GetxController {
  static TestController get to => Get.find();

  RxList<Widget> targetList = <Widget>[].obs;
  RxList<Widget> reorderList = <Widget>[].obs;
  RxBool selected = false.obs;

  addTarget(Widget widget) {
    targetList.add(widget);
  }

  addReorder(Widget widget) {
    reorderList.add(widget);
  }

  removeReorder(Key key) {
    reorderList.removeWhere((element) => element.key == key);
  }
}
