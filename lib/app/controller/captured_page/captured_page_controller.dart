import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class CapturedPageController extends GetxController {
  final RxInt _counter = 0.obs;
  late Uint8List _imageFile;
  late ScreenshotController screenshotController;

  @override
  void onInit() {
    super.onInit();
    screenshotController = ScreenshotController();
  }
}
