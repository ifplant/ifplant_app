import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

AppBar selectPlantDetailAppbar(Plant plant) {
  return AppBar(
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
      plant.kind,
      style: baseTextStyle,
    ),
  );
}
