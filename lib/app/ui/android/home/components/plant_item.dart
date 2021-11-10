import 'package:flutter/material.dart';
import 'package:ifplant_app/app/controller/controllers.dart'
    show HomeController;
import 'package:ifplant_app/app/ui/android/appBar/home_appbar.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

class PlantItem extends StatelessWidget {
  const PlantItem({
    Key? key,
    required this.index,
    required this.controller,
  }) : super(key: key);

  final int index;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      key: key,
      data: controller.selectedPlants[index].id,
      child: Visibility(
        visible: !controller.selectedPlants[index].isDraged,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
              height: 110,
              width: 80,
              color: Colors.red,
              child: Text(controller.selectedPlants[index].name),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  child: const CircleAvatar(
                    child: Center(
                      child: Icon(Icons.close, size: 15),
                    ),
                    radius: 13,
                    backgroundColor: primaryColor,
                  ),
                  onTap: () {
                    controller.removePlant(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      feedback: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
            height: 110,
            width: 80,
            color: Colors.red,
            child: Text(controller.selectedPlants[index].name),
          ),
        ],
      ),
      onDragEnd: (detail) {
        final _dx = detail.offset.dx - 50;
        final _dy = detail.offset.dy -
            homeAppBar.preferredSize.height -
            MediaQuery.of(context).padding.top -
            50;
        controller.selectedPlants[index].dragPoint = Offset(_dx, _dy);
      },
    );
  }
}
