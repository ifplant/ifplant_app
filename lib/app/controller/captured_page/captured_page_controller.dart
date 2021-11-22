import 'dart:io';

import 'package:get/get.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'package:screenshot/screenshot.dart';

class CapturedPageController extends GetxController {
  int _counter = 0;
  final double pixelRatio = Get.context!.devicePixelRatio;
  late ScreenshotController screenshotController;

  @override
  void onInit() {
    super.onInit();
    screenshotController = ScreenshotController();
  }

  Future<void> captureScreen() async {
    await screenshotController
        .capture(
            delay: const Duration(milliseconds: 10), pixelRatio: pixelRatio)
        .then((image) async {
      if (image != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath =
            await File('${directory.path}/capture_image_$_counter.png')
                .create();
        await imagePath.writeAsBytes(image);
        await ImageGallerySaver.saveFile(imagePath.path);
        _counter++;
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
