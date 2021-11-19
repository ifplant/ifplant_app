import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/android/select_detail/select_plant_detail.dart';

class GridPlantItem extends StatelessWidget {
  final Plant plant;

  GridPlantItem({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(() => SelectPlantDetail(), arguments: plant);
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
  }
}
