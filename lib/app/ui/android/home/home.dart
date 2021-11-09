import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/route/app_pages.dart';
import 'package:ifplant_app/app/ui/android/home/components/dragable_plant.dart';
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
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    controller.toggleBackgroundSelect();
                  },
                  child: SizedBox(
                    width: Get.size.width * 0.85,
                    height: Get.size.width * 0.85,
                    child: DragTarget(
                      builder: (context, candiated, rejected) {
                        return Obx(
                          () => controller.selectedImage.path.isNotEmpty
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
                child: GetBuilder<HomeController>(builder: (_) {
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
                            final item = _.selectedPlants.removeAt(oldIndex);
                            _.addPlant(item, index: newIndex);
                          },
                          itemBuilder: (context, index) {
                            return Draggable(
                              key: Key('$index'),
                              data: _.selectedPlants[index].id,
                              child: Visibility(
                                visible: !_.selectedPlants[index].isDraged,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          right: 5, left: 5, top: 10),
                                      height: 110,
                                      width: 80,
                                      color: Colors.red,
                                      child: Text(_.selectedPlants[index].name),
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
                              ),
                              feedback: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        right: 5, left: 5, top: 10),
                                    height: 110,
                                    width: 80,
                                    color: Colors.red,
                                    child: Text(_.selectedPlants[index].name),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: _.selectedPlants.length,
                        ),
                        _.selectedPlants.length < 10
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
      ),
    );
  }
}
