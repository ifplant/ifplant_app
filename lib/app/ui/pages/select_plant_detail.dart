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
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/sample_plant.png'),
            ],
          ),
          Text('화분명 : '),
          Text('높이 : '),
          Text('가격 : '),
          Text('관리난이도 : '),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: primaryColor,
                minimumSize: Size(200, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30))),
            onPressed: () {},
            child: const Text(
              '화분추가',
            ),
          ),
        ],
      ),
    );
  }
}
