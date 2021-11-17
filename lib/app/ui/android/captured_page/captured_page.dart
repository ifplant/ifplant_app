import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/controller/controllers.dart';
import 'package:ifplant_app/app/ui/android/appBar/captured_page_appbar.dart';
import 'package:ifplant_app/app/ui/android/captured_page/components/captureble_image.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';

class CapturedPage extends StatelessWidget {
  CapturedPage({Key? key}) : super(key: key);
  final controller = Get.put(CapturedPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: capturePageAppbar,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CapturebleImage(),
            SizedBox(height: Get.size.height * 0.07),
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text('이미지를 저장 하시겠습니까?', style: minimalTextStyle),
            ),
            SizedBox(height: Get.size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.size.width, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38),
                  ),
                  primary: primaryColor,
                ),
                child: const Text('저장하기', style: buttonTextStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
