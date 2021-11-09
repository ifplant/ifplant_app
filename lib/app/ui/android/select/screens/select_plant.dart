import 'package:flutter/material.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/android/select/components/plant_item.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class SelectPlant extends StatelessWidget {
  final List<Plant> loadedPlants = [
    Plant(
      name: '싱고니움',
      engName: 'Singonium',
      price: 40000,
      desc: '안녕하세요 예제입니다.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
    Plant(
      name: '산호초',
      engName: 'Sanhocho',
      price: 70000,
      desc: '안녕하세요 예제입니다.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
    Plant(
      name: '스파티필렁',
      engName: 'Spatti',
      price: 120000,
      desc: '안녕하세요 예제입니다.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
    Plant(
      name: '테이블야자',
      engName: 'TableYaza',
      price: 100000,
      desc: '안녕하세요 예제입니다.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
    Plant(
      name: '더피',
      engName: 'Duffy',
      price: 190000,
      desc: '안녕하세요 예제입니다.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
    Plant(
      name: '카랑코에',
      engName: 'Karang',
      price: 80000,
      desc: '안녕하세요 예제입니다.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
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
            child: GridView.builder(
              itemCount: loadedPlants.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => PlantItem(
                name: loadedPlants[index].name,
                engName: loadedPlants[index].engName,
                price: loadedPlants[index].price,
                kind: loadedPlants[index].kind,
                imagePath: loadedPlants[index].imagePath,
                desc: loadedPlants[index].desc,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
