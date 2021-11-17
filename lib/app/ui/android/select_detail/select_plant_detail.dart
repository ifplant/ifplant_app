import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/theme/app_text_theme.dart';
import 'package:ifplant_app/main.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'Controller/select_detail_controller.dart';
import 'components/show_bottom_sheet.dart';

class SelectPlantDetail extends GetView<SelectDetailController> {
  const SelectPlantDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            CupertinoIcons.back,
            size: 24,
          ),
          centerTitle: true, //Title text 가운데로 정렬
          title: Text(
            "관엽식물",
            style: appBarTitleTextStyle,
          ),
          backgroundColor: Colors.transparent, //앱바 투명하게 하기
          elevation: 0.0,
          iconTheme: IconThemeData(color: primaryColor),
        ),
        extendBodyBehindAppBar: true, //body 위에 App bar 고정
        backgroundColor: backgroundColor,
        body: Stack(
          children: <Widget>[
            Center(
              child: Image.asset('assets/images/img_bostonfern.png'),
            ),
            ShowbottomSheet(),
          ],
        ),
      ),
    );
  }
}
