import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/home/home_controller.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

final AppBar homeAppBar = AppBar(
  elevation: 0.0,
  centerTitle: true,
  titleSpacing: 0,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Obx(
            () => HomeController.to.selectedImage.path.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: TextButton(
                      onPressed: () {
                        HomeController.to.pickSingleImage();
                      },
                      child: const Text(
                        '배경수정',
                        style: appBarActionTextStyle,
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      '배경수정',
                      style: appBarActionInactiveTextStyle,
                    ),
                  ),
          ),
        ),
      ),
      const Center(
        child: Text(
          '내 공간',
          style: appBarTitleTextStyle,
        ),
      ),
      Expanded(
        child: Align(
          alignment: Alignment.centerRight,
          child: Obx(
            () => HomeController.to.selectedImage.path.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        '완료',
                        style: appBarActionTextStyle,
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Text(
                      '완료',
                      style: appBarActionInactiveTextStyle,
                    ),
                  ),
          ),
        ),
      ),
    ],
  ),
);
