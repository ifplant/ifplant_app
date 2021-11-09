import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  Offset offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: offset.dx,
          top: offset.dy,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                offset = Offset(
                    offset.dx + details.delta.dx, offset.dy + details.delta.dy);
              });
            },
            child: Container(
              height: Get.size.height,
              width: Get.size.width,
              child: ResizebleWidget(
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
