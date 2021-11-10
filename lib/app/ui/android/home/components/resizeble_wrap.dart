import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

class ResizebleWidget extends StatefulWidget {
  const ResizebleWidget({
    Key? key,
    required this.child,
    required this.index,
  }) : super(key: key);

  final Widget child;
  final int index;

  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();
}

const ballDiameter = 15.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double height = 110;
  double width = 80;

  double top = 50;
  double left = 50;

  double zoom = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: Transform.scale(
            scale: zoom,
            child: SizedBox(
              height: height,
              width: width,
              child: widget.child,
            ),
          ),
        ),
        GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.dragedPlants[widget.index].isClicked) {
              return Stack(
                children: [
                  //top left
                  Positioned(
                    top: top - (height * zoom - height) / 2 - ballDiameter / 2,
                    left: left - (width * zoom - width) / 2 - ballDiameter / 2,
                    child: ManipulatingBall(
                      onDrag: (dx, dy) {
                        var mid = dx + dy;
                        var zoomRate =
                            (width + height - mid) / (width + height);
                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    ),
                  ),

                  // top right
                  Positioned(
                    top: top - (height * zoom - height) / 2 - ballDiameter / 2,
                    left: left +
                        (width * zoom - width) / 2 +
                        width -
                        ballDiameter / 2,
                    child: ManipulatingBall(
                      onDrag: (dx, dy) {
                        var mid = (-dx + dy);
                        var zoomRate =
                            (width + height - mid) / (width + height);

                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    ),
                  ),

                  // bottom right
                  Positioned(
                    top: top +
                        (height * zoom - height) / 2 +
                        height -
                        ballDiameter / 2,
                    left: left +
                        (width * zoom - width) / 2 +
                        width -
                        ballDiameter / 2,
                    child: ManipulatingBall(
                      onDrag: (dx, dy) {
                        var mid = (-dx - dy);
                        var zoomRate =
                            (width + height - mid) / (width + height);
                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    ),
                  ),
                  // bottom left
                  Positioned(
                    top: top +
                        (height * zoom - height) / 2 +
                        height -
                        ballDiameter / 2,
                    left: left - (width * zoom - width) / 2 - ballDiameter / 2,
                    child: ManipulatingBall(
                      onDrag: (dx, dy) {
                        var mid = (dx - dy);
                        var zoomRate =
                            (width + height - mid) / (width + height);
                        setState(() {
                          zoom = zoom * pow(zoomRate, 2);
                        });
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Stack(
                children: [
                  Positioned(
                    top: top - (height * zoom - height) / 2 - ballDiameter / 2,
                    left: left - (width * zoom - width) / 2 - ballDiameter / 2,
                    child: AnimatedOpacity(
                      opacity:
                          HomeController.to.isDeleteButtonClick ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 150),
                      child: InkWell(
                        child: const CircleAvatar(
                          child: Center(
                            child: Icon(Icons.close, size: 15),
                          ),
                          radius: 13,
                          backgroundColor: primaryColor,
                        ),
                        onTap: () {
                          controller.removeDragedItem(widget.index);
                          controller.removePlant(widget.index);
                        },
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}

class ManipulatingBall extends StatefulWidget {
  ManipulatingBall({required this.onDrag});

  final Function onDrag;

  @override
  _ManipulatingBallState createState() => _ManipulatingBallState();
}

class _ManipulatingBallState extends State<ManipulatingBall> {
  late double initX;
  late double initY;

  _handleDrag(details) {
    setState(() {
      initX = details.globalPosition.dx;
      initY = details.globalPosition.dy;
    });
  }

  _handleUpdate(details) {
    var dx = details.globalPosition.dx - initX;
    var dy = details.globalPosition.dy - initY;
    initX = details.globalPosition.dx;
    initY = details.globalPosition.dy;
    widget.onDrag(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: _handleDrag,
      onPanUpdate: _handleUpdate,
      child: Container(
        width: ballDiameter,
        height: ballDiameter,
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
