import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/controllers.dart'
    show HomeController;
import 'package:ifplant_app/app/data/model/home/selected_plant_model.dart';
import 'package:ifplant_app/app/ui/android/home/components.dart'
    show ResizebleWidget;

class DraggablePlant extends StatefulWidget {
  const DraggablePlant({
    required this.plant,
    Key? key,
  }) : super(key: key);

  final SelectedPlant plant;

  @override
  _DraggablePlantState createState() => _DraggablePlantState();
}

class _DraggablePlantState extends State<DraggablePlant> {
  @override
  void initState() {
    super.initState();
  }

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
            onLongPress: () {
              HomeController.to.toggleDeleteButtonSelect(widget.plant);
            },
            child: SizedBox(
              height: Get.size.height,
              width: Get.size.width,
              child: ResizebleWidget(
                plant: widget.plant,
                child: Image.memory(
                  widget.plant.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
