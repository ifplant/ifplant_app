import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/data/model/home/selected_plant_model.dart';
import 'package:ifplant_app/app/ui/android/select_detail/components/plant_svg.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:intl/intl.dart';

class BuildBottomSheet extends StatelessWidget {
  final Plant plant;

  const BuildBottomSheet({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 310,
      padding: const EdgeInsets.only(
        top: 18,
        left: 36,
        right: 36,
      ),
      child: Column(
        children: [
          InkWell(
            child: Transform.rotate(
              angle: (180 * math.pi) / 180,
              child: SvgPicture.asset(
                'assets/icon/arrow_less.svg',
                width: 24,
                height: 24,
              ),
            ),
            onTap: () => Get.back(result: false),
          ),
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            plant.name,
                            style: const TextStyle(
                                fontSize: 18,
                                color: primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              plant.kind,
                              style: const TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 9,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        NumberFormat('####,####,###원')
                            .format(int.parse(plant.price))
                            .replaceAll(' ', ''),
                        style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    plant.engName,
                    style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 9,
                    ),
                  ),
                  const SizedBox(height: 17),
                  Container(
                    height: 100,
                    child: Text(
                      plant.description,
                      style: const TextStyle(
                        height: 1.48,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlantSvg(title: plant.level, icon: 'level'),
                        PlantSvg(title: plant.light, icon: 'light'),
                        PlantSvg(title: plant.water, icon: 'water'),
                        PlantSvg(title: plant.temperature, icon: 'temp'),
                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        height: 40,
                        width: 280,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onPrimary: Colors.white,
                              primary: primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          onPressed: () {
                            HomeController.to.addPlant(
                              SelectedPlant(
                                  id: HomeController.to.selectedIdCount,
                                  image: plant.image),
                            );
                            Get.back(result: true);
                          },
                          child: const Text(
                            '화분추가',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
