import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
      desc:
          '보스턴 고사리는 역사상 가장 오래된 식물 중 하나에요. 주로 잎이 아래쪽으로 휘어져 있어요. 건조한 환경에서 습도를 높이는데 탁월한 식물입니다. 공기청정식물로 음이온을 발생시켜 실내의 공기를 상쾌하게 만들어 준답니다. 싱그러운 연두색 잎은 플로리스트와 가드너에게 꽃 장식용으로 친숙한 식물이에요.',
      kind: '관엽식물',
      imagePath: 'assets/images/sample_plant.png',
    ),
    Plant(
      name: '산호초',
      engName: 'Sanhocho',
      price: 70000,
      desc:
          '보스턴 고사리는 역사상 가장 오래된 식물 중 하나에요. 주로 잎이 아래쪽으로 휘어져 있어요. 건조한 환경에서 습도를 높이는데 탁월한 식물입니다. 공기청정식물로 음이온을 발생시켜 실내의 공기를 상쾌하게 만들어 준답니다. 싱그러운 연두색 잎은 플로리스트와 가드너에게 꽃 장식용으로 친숙한 식물이에요.',
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
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/svg/arrow_back.svg',
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
