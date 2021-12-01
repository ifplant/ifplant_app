import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/controllers.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';

class SelectPlantWidget extends GetWidget<HomeController> {
  final Plant plant;
  const SelectPlantWidget(this.plant, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      itemCount: controller.selectedPlants.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.8,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed('/plant/');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                child: Image.memory(plant.image),
                height: 180,
                width: 180,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                plant.name,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    ));
  }
}
