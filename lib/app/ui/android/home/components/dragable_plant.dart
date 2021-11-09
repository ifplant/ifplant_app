import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/android/home/components/resizeble_wrap.dart';

class DraggablePlant extends StatefulWidget {
  const DraggablePlant({
    required this.plant,
    Key? key,
  }) : super(key: key);

  final Plant plant;

  @override
  _DraggablePlantState createState() => _DraggablePlantState();
}

class _DraggablePlantState extends State<DraggablePlant> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: widget.plant.dragPoint.dx,
          top: widget.plant.dragPoint.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                widget.plant.dragPoint = Offset(
                    widget.plant.dragPoint.dx + details.delta.dx,
                    widget.plant.dragPoint.dy + details.delta.dy);
              });
            },
            onTap: () {
              HomeController.to.toggleBackgroundSelect(widget.plant);
            },
            child: Container(
              height: Get.size.height,
              width: Get.size.width,
              child: ResizebleWidget(
                index: HomeController.to.dragedPlants
                    .indexWhere((element) => element == widget.plant),
                child: Container(
                  color: Colors.blue,
                  // child: Image.memory(
                  //   widget.plant.image,
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
