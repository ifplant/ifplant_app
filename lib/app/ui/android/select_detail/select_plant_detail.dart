import 'package:flutter/material.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/android/appBar/select_plant_detail.dart';
import 'package:ifplant_app/app/ui/android/select_detail/components/show_bottom_appbar.dart';
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
        appBar: selectPlantDetailAppbar(plantItem),
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
