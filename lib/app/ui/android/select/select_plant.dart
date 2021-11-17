import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/controllers.dart';
import 'package:ifplant_app/app/ui/android/select/components/grid_plant_item.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class SelectPlant extends GetWidget<DataBaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icon/arrow_back.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          '전체',
          style: baseTextStyle,
        ),
      ),
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
