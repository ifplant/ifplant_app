import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

final AppBar capturePageAppbar = AppBar(
  backgroundColor: backgroundColor,
  elevation: 0.0,
  centerTitle: true,
  title: const Text(
    '나의 공간',
    style: TextStyle(color: primaryColor),
  ),
  leading: IconButton(
    icon: const Icon(
      CupertinoIcons.back,
      color: primaryColor,
      size: 24,
    ),
    onPressed: () {
      Get.back();
    },
  ),
);
