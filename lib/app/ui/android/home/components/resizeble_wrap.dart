import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';

class ResizebleWidget extends StatefulWidget {
  ResizebleWidget({required this.child});

  final Widget child;

  @override
  _ResizebleWidgetState createState() => _ResizebleWidgetState();
}

const ballDiameter = 20.0;

class _ResizebleWidgetState extends State<ResizebleWidget> {
  double height = 110;
  double width = 80;

  double top = 0;
  double left = 0;

  double zoom = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: top,
          left: left,
          child: GestureDetector(
            onTap: () {
              HomeController.to.toggleBackgroundSelect();
            },
            child: Transform.scale(
              scale: zoom,
              child: Container(
                height: height,
                width: width,
                child: widget.child,
              ),
            ),
          ),
        ),
        Obx(
          () => HomeController.to.isSelectBackground
              ? Stack(
                  children: [
                    Positioned(
                      top:
                          top - (height * zoom - height) / 2 - ballDiameter / 2,
                      left:
                          left - (width * zoom - width) / 2 - ballDiameter / 2,
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
                    // top middle
                    Positioned(
                      top:
                          top - (height * zoom - height) / 2 - ballDiameter / 2,
                      left: left + width / 2 - ballDiameter / 2,
                      child: ManipulatingBall(
                        onDrag: (dx, dy) {
                          var newHeight = height - dy;
                          setState(() {
                            height = newHeight > 0 ? newHeight : 0;
                            top = top + dy;
                          });
                        },
                      ),
                    ),
                    // top right
                    Positioned(
                      top:
                          top - (height * zoom - height) / 2 - ballDiameter / 2,
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
                    // center right
                    Positioned(
                      top: top + height / 2 - ballDiameter / 2,
                      left: left +
                          (width * zoom - width) / 2 +
                          width -
                          ballDiameter / 2,
                      child: ManipulatingBall(
                        onDrag: (dx, dy) {
                          var newWidth = width + dx;

                          setState(() {
                            width = newWidth > 0 ? newWidth : 0;
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
                    // bottom center
                    Positioned(
                      top: top +
                          (height * zoom - height) / 2 +
                          height -
                          ballDiameter / 2,
                      left: left + width / 2 - ballDiameter / 2,
                      child: ManipulatingBall(
                        onDrag: (dx, dy) {
                          var newHeight = height + dy;

                          setState(() {
                            height = newHeight > 0 ? newHeight : 0;
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
                      left:
                          left - (width * zoom - width) / 2 - ballDiameter / 2,
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
                    //left center
                    Positioned(
                      top: top + height / 2 - ballDiameter / 2,
                      left:
                          left - (width * zoom - width) / 2 - ballDiameter / 2,
                      child: ManipulatingBall(
                        onDrag: (dx, dy) {
                          var newWidth = width - dx;

                          setState(() {
                            width = newWidth > 0 ? newWidth : 0;
                            left = left + dx;
                          });
                        },
                      ),
                    ),
                    // center center
                    Positioned(
                      top: top + height / 2 - ballDiameter / 2,
                      left: left + width / 2 - ballDiameter / 2,
                      child: ManipulatingBall(
                        onDrag: (dx, dy) {
                          setState(() {
                            top = top + dy;
                            left = left + dx;
                          });
                        },
                      ),
                    ),
                  ],
                )
              : Container(),
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
          color: Colors.blue.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
