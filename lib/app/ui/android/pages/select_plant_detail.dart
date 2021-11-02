import 'package:flutter/material.dart';
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
        children: [
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/sample_plant.png'),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            '화분명 : 싱고니움',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            '높이 : ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            '가격 : ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Text(
            '관리난이도 : ',
            style: TextStyle(fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: primaryColor,
                  minimumSize: const Size(300, 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {},
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
