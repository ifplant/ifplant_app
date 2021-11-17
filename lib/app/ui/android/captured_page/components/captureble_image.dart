import 'package:flutter/material.dart';
import 'package:ifplant_app/app/controller/captured_page/captured_page_controller.dart';
import 'package:ifplant_app/app/controller/controllers.dart'
    show HomeController;
import 'package:ifplant_app/app/ui/android/home/components.dart'
    show DraggablePlant;
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class CapturebleImage extends GetWidget<CapturedPageController> {
  const CapturebleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller.screenshotController,
      child: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            HomeController.to.unToggleBackgroundSelect();
          },
          child: SizedBox(
            width: Get.size.width * 0.85,
            height: Get.size.width * 0.85,
            child: DragTarget(
              builder: (context, candiated, rejected) {
                return GetBuilder<HomeController>(
                    builder: (controller) => Stack(
                          children: [
                            SizedBox(
                              height: Get.size.width * 0.85,
                              width: Get.size.width * 0.85,
                              child: Image.file(
                                controller.selectedImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ...List.generate(
                              controller.dragedPlants.length,
                              (index) => DraggablePlant(
                                plant: controller.dragedPlants[index],
                              ),
                            ),
                          ],
                        ));
              },
              onWillAccept: (data) {
                return HomeController.to.selectedPlants
                    .where((element) => element.id == data)
                    .isNotEmpty;
              },
              onAccept: (int data) {
                HomeController.to.toggleDragedItem(data);
              },
            ),
          ),
        ),
      ),
    );
  }
}
