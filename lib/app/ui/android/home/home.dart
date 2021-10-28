import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
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
                  width: 336,
                  height: 336,
                  child: Image.network(
                    'https://i.pinimg.com/originals/de/bb/ff/debbff2321788a6d4a7b3bb00237a76e.jpg',
                    fit: BoxFit.cover,
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
                height: 100,
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
                              return Container(
                                key: Key('$index'),
                                margin: const EdgeInsets.only(right: 4),
                                height: 100,
                                width: 80,
                                color: Colors.red,
                                child:
                                    Text(controller.selectedPlants[index].name),
                              );
                            },
                            itemCount: controller.selectedPlants.length,
                          ),
                          controller.selectedPlants.length < 10
                              ? SizedBox(
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
                                      controller.addPlant(Plant(
                                          name: controller.selectedPlants.length
                                              .toString()));
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
