import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/android/select_detail/components/show_bottom_appbar.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';
import 'package:get/get.dart';

class SelectPlantDetail extends StatefulWidget {
  const SelectPlantDetail({Key? key}) : super(key: key);

  @override
  State<SelectPlantDetail> createState() => _SelectPlantDetailState();
}

class _SelectPlantDetailState extends State<SelectPlantDetail> {
  final Plant plantItem = Get.arguments as Plant;

  @override
  void initState() {
    super.initState();
  }

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
        bottomNavigationBar: ShowBottomAppBar(plant: plantItem));
  }
}
