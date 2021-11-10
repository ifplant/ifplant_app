import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/route/app_pages.dart';
import 'package:ifplant_app/app/ui/android/appBar/home_appbar.dart';
import 'package:ifplant_app/app/ui/android/home/components/dragable_plant.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

import 'components/plant_item.dart';

class Home extends GetWidget<HomeController> {
  static const double hiddenLeft = 22.0;
  static const double hiddenTop = 14.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  controller.unToggleBackgroundSelect();
                },
                child: SizedBox(
                  width: Get.size.width * 0.85,
                  height: Get.size.width * 0.85,
                  child: DragTarget(
                    builder: (context, candiated, rejected) {
                      return GetBuilder<HomeController>(
                        builder: (context) => controller
                                .selectedImage.path.isNotEmpty
                            ? Stack(
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
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                      onPressed: controller.pickSingleImage,
                                    ),
                                    const Text('배경 고르기'),
                                  ],
                                ),
                              ),
                      );
                    },
                    onWillAccept: (data) {
                      return controller.selectedPlants
                          .where((element) => element.id == data)
                          .isNotEmpty;
                    },
                    onAccept: (int data) {
                      controller.toggleDragedItem(data);
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                '내 화분',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              height: 120,
              child: GetBuilder<HomeController>(builder: (homeController) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      ReorderableListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        onReorder: (oldIndex, newIndex) {
                          if (oldIndex < newIndex) {
                            newIndex--;
                          }
                          final item =
                              homeController.selectedPlants.removeAt(oldIndex);
                          homeController.addPlant(item, index: newIndex);
                        },
                        itemBuilder: (ctx, index) {
                          return PlantItem(
                            index: index,
                            controller: homeController,
                            key: Key('$index'),
                          );
                        },
                        itemCount: homeController.selectedPlants.length,
                      ),
                      homeController.selectedPlants.length < 10
                          ? Container(
                              margin: const EdgeInsets.only(left: 10),
                              height: 46,
                              width: 46,
                              child: InkWell(
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: primaryColor,
                                ),
                                onTap: () {
                                  Get.toNamed(Routes.PLANT);
                                },
                              ),
                            )
                          : Container(),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
