import 'dart:typed_data';

import 'package:flutter/material.dart';

class SelectedPlant {
  SelectedPlant({
    required this.id,
    required this.image,
  });

  final int id;
  final Uint8List image;
  bool isDraged = false;
  bool isClicked = false;
  bool isDeleteButtonClick = false;
  Offset dragPoint = const Offset(0, 0);
}
