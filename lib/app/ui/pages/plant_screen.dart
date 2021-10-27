import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  Widget _selectplant(String name, String path, void Function()? ontap) {
    return Expanded(
        child: GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: ontap,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  child: Image.asset(path),
                  height: 300,
                ),
              ),
              Text(name),
            ],
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: primaryColor),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text('전체', style: appBarTitleTextStyle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _selectplant('예제화분', 'assets/images/sample_plant.png', () {}),
          ],
        ),
      ),
    );
  }
}
