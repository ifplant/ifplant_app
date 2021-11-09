import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/android/select_detail/select_plant_detail.dart';

class PlantItem extends StatelessWidget {
  final String name;
  final String engName;
  final int price;
  final String imagePath;
  final String desc;
  final String kind;

  PlantItem({
    required this.name,
    required this.engName,
    required this.price,
    required this.imagePath,
    required this.desc,
    required this.kind,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(SelectPlantDetail(
                name: name,
                engName: engName,
                price: price,
                imagePath: imagePath,
                desc: desc,
                kind: kind));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: Image.asset(imagePath),
            height: 180,
            width: 180,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
