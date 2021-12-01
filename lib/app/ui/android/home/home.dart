import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/ui/android/appBar/home_appbar.dart';
import 'package:ifplant_app/app/ui/android/home/components.dart'
    show SelectedBackgound, SelectedPlantList;
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class Home extends GetWidget<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar,
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SelectedBackgound(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text('내 화분', style: minimalTextStyle),
            ),
            const SizedBox(height: 16),
            const SelectedPlantList()
          ],
        ),
      ),
    );
  }
}
