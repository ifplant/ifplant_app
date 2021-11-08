import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/route/app_pages.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class SelectPlantDetail extends StatelessWidget {
  const SelectPlantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '식물이름',
          style: baseTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Container(
              width: 242,
              height: 242,
              child: Image.asset('assets/images/sample_plant.png'),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                '화분명 : 싱고니움',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '높이 : 100cm',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '가격 : 70,000',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '관리난이도 : 하',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  minimumSize: const Size(300, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                // HomeController.to.addPlant(Plant(id: 1));
                Get.offAndToNamed(Routes.INITIAL);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  '화분추가',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
