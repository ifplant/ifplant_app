import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlantSvg extends StatelessWidget {
  final String title;
  final String icon;
  const PlantSvg({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icon/$icon.svg',
            width: 24,
            height: 24,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
