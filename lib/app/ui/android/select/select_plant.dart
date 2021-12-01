import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/controllers.dart';
import 'package:ifplant_app/app/ui/android/appBar/select_plant_appbar.dart';
import 'package:ifplant_app/app/ui/android/select/components/grid_plant_item.dart';

class SelectPlant extends GetWidget<DataBaseController> {
  const SelectPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectPlantAppbar,
      body: Column(
        children: [
          Expanded(
            child: Obx(() => GridView.builder(
                  itemCount: controller.plantList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.8,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => GridPlantItem(
                    plant: controller.plantList[index],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
