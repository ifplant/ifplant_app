import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/route/app_pages.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class Home extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text('내공간', style: appBarTitleTextStyle),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                '완료',
                style: appBarActionTextStyle,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  width: Get.size.width * 0.85,
                  height: Get.size.width * 0.85,
                  child: DragTarget(
                    builder: (context, candiated, rejected) {
                      return Obx(
                        () => controller.selectedImage.path.isNotEmpty
                            ? Image.file(
                                controller.selectedImage,
                                fit: BoxFit.cover,
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
                      return controller.selectedPlants.contains(data);
                    },
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
                child: Obx(() => SingleChildScrollView(
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
                                  controller.selectedPlants.removeAt(oldIndex);
                              controller.addPlant(item, index: newIndex);
                            },
                            itemBuilder: (context, index) {
                              return Draggable(
                                key: Key('$index'),
                                data: controller.selectedPlants[index].name,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 5, left: 5, top: 10),
                                      height: 110,
                                      width: 80,
                                      color: Colors.red,
                                      child: Text(controller
                                          .selectedPlants[index].name),
                                    ),
                                    Positioned(
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: InkWell(
                                          child: const CircleAvatar(
                                            child: Center(
                                              child:
                                                  Icon(Icons.close, size: 15),
                                            ),
                                            radius: 13,
                                            backgroundColor: primaryColor,
                                          ),
                                          onTap: () {
                                            controller.removePlant(index);
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                feedback: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 5, left: 5, top: 10),
                                      height: 110,
                                      width: 80,
                                      color: Colors.red,
                                      child: Text(controller
                                          .selectedPlants[index].name),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: controller.selectedPlants.length,
                          ),
                          controller.selectedPlants.length < 10
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
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
