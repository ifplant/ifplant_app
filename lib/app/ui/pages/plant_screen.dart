import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class PlantScreen extends StatelessWidget {
  const PlantScreen({Key? key}) : super(key: key);

  Widget _head() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.arrow_back_ios,
                color: Colors.green,
              ),
              const SizedBox(width: 10),
              Text(
                '내공간',
                style: baseTextStyle,
              ),
              const SizedBox(width: 80),
            ],
          ),
        ],
      ),
    );
  }

  Widget _plant() {
    return Expanded(
        child: GridView.builder(
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.8,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 500,
            color: Colors.amber,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _head(),
            _plant(),
          ],
        ),
      ),
    );
  }
}
