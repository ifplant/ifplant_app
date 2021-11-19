import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class SelectPlantDetail extends StatefulWidget {
  @override
  State<SelectPlantDetail> createState() => _SelectPlantDetailState();
}

class _SelectPlantDetailState extends State<SelectPlantDetail> {
  final Plant plantItem = Get.arguments as Plant;

  @override
  void initState() {
    super.initState();
  }

  bool _show = false;

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
        title: Text(
          plantItem.kind,
          style: baseTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 112),
                  Center(
                    child: Container(
                      width: 288,
                      height: 290,
                      child: Image.memory(plantItem.image),
                    ),
                  ),
                  const SizedBox(height: 85),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
          child: BottomAppBar(
              elevation: 10.0,
              child: Container(
                height: 100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                      child: GestureDetector(
                        child: SvgPicture.asset(
                          'assets/icon/arrow_less.svg',
                          width: 24,
                          height: 24,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            barrierColor: Colors.transparent,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45),
                              ),
                            ),
                            context: context,
                            builder: _buildBottomSheet,
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    plantItem.name,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(
                                      plantItem.kind,
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
                                NumberFormat('###,###,###,###원')
                                    .format(int.parse(plantItem.price))
                                    .replaceAll(' ', ''),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            plantItem.engName,
                            style: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 9,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    if (!_show) {
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
            Transform.rotate(
              angle: (180 * math.pi) / 180,
              child: SvgPicture.asset(
                'assets/icon/arrow_less.svg',
                width: 24,
                height: 24,
              ),
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
                              plantItem.name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w700),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                plantItem.kind,
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
                              .format(int.parse(plantItem.price))
                              .replaceAll(' ', ''),
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      plantItem.engName,
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
                        plantItem.description,
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
                          _plant_svg(plantItem.level, 'level'),
                          _plant_svg(plantItem.light, 'light'),
                          _plant_svg(plantItem.water, 'water'),
                          _plant_svg(plantItem.temperature, 'temp'),
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
                            onPressed: () {},
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
    } else {
      return const Text('데이터가 없습니다.');
    }
  }

  Widget _plant_svg(String title, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icon/$icon.svg',
            width: 24,
            height: 24,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
