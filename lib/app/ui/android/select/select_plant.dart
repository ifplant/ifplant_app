import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/android/select_detail/components/show_bottom_sheet.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

import 'components/select_plant_widget.dart';

class SelectPlant extends StatelessWidget {
  const SelectPlant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: primaryColor),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '전체',
            style: baseTextStyle,
          ),
        ),
        body: Column(
          children: [
            SelectPlantWidget(
              name: '예제화분',
              path: 'assets/images/sample_plant.png',
              ontap: () {
                Get.toNamed('plant_detail');
              },
            ),
          ],
        ),
      ),
    );
  }
}
