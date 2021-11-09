import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class SelectPlantDetail extends StatelessWidget {
  final String name;
  final String engName;
  final int price;
  final String imagePath;
  final String desc;
  final String kind;

  SelectPlantDetail({
    required this.name,
    required this.engName,
    required this.price,
    required this.imagePath,
    required this.desc,
    required this.kind,
  });

  Widget _bottomSheet() {
    return Container(
      width: 360,
      height: 80,
      child: Column(
        children: [
          const Center(
            child: Icon(
              Icons.expand_less,
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    engName,
                    style: const TextStyle(
                      fontSize: 9,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              Text(
                kind,
                style: const TextStyle(
                  fontSize: 9,
                  color: primaryColor,
                ),
              ),
              Text(
                '${price} 만원',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          kind,
          style: baseTextStyle,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 112),
          Center(
            child: Container(
              width: 288,
              height: 290,
              child: Image.asset(imagePath),
            ),
          ),
          const SizedBox(height: 85),
          _bottomSheet(),
        ],
      ),
//           Padding(
//             padding: const EdgeInsets.only(top: 40.0),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   primary: primaryColor,
//                   minimumSize: const Size(300, 30),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30))),
//               onPressed: () {
// //                HomeController.to.addPlant(Plant(name: 'eeee'));
//                 //              Get.offAndToNamed(Routes.INITIAL);
//               },
//               child: const Padding(
//                 padding: EdgeInsets.symmetric(vertical: 10),
//                 child: Text(
//                   '화분추가',
//                   style: TextStyle(fontSize: 20),
//                 ),
//               ),
//             ),
//           ),
    );
  }
}
