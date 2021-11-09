import 'package:flutter/material.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

final AppBar homeAppBar = AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  centerTitle: true,
  title: const Text('내공간', style: appBarTitleTextStyle),
  titleSpacing: 0,
  leading: TextButton(
    onPressed: () {},
    child: const Text(
      '배경 변경',
      style: appBarActionTextStyle,
    ),
  ),
  actions: [
    TextButton(
      onPressed: () {},
      child: const Text(
        '완료',
        style: appBarActionTextStyle,
      ),
    )
  ],
);
