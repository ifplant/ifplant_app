import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/ui/android/select_detail/Controller/select_detail_controller.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';

class ShowbottomSheet extends StatelessWidget {
  ShowbottomSheet({Key? key}) : super(key: key);
  SelectDetailController selectDetailController =
      Get.put(SelectDetailController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DraggableScrollableSheet(
        initialChildSize: selectDetailController.bottomsheet_height.value,
        minChildSize: selectDetailController.bottomsheet_height.value,
        maxChildSize: selectDetailController.bottomsheet_height.value,
        expand: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        "assets/images/icon_arrow_down.svg",
                      ),
                      onPressed: () {
                        //사이즈 조절
                        print("텍스트 조절");
                        selectDetailController.bSelect.value = true;
                        print(
                            "${selectDetailController.bottomsheet_height.value}");
                        print(
                            "bSelect:${selectDetailController.bSelect.value}");
                        selectDetailController.showBottomSheetAnim();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "보스턴고사리",
                              style: TextStyle(
                                fontFamily: 'Noto_Serif_KR',
                                fontSize: 21,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "관엽식물",
                                style: TextStyle(
                                  fontFamily: 'Noto_Serif_KR',
                                  fontSize: 12,
                                  color: Color(0xFF357E6E),
                                  fontWeight: FontWeight.bold,
                                ),
                                //textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "40,000원",

                          style: TextStyle(
                            fontFamily: 'Noto_Serif_KR',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.right,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Boston fern",
                            style: TextStyle(
                              fontFamily: 'Noto_Serif_KR',
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 180,
                        child: Text(
                          "보스턴 고사리는 역사상 가장 오래된 식물 중 하나에요. 주로 잎이 아래쪽으로 휘어져 있어요. 건조한 환경에서 습도를 높이는데 탁월한 식물입니다. 공기청정식물로 음이온을 발생시켜 실내의 공기를 상쾌하게 만들어 준답니다. 싱그러운 연두색 잎은 플로리스트와 가드너에게 꽃 장식용으로 친숙한 식물이에요.",
                          maxLines: 7,
                          style: TextStyle(
                              color: Color(0xff9e9e9e),
                              fontFamily: 'Noto_Serif_KR',
                              fontSize: 14,
                              height: 1.4,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                "assets/images/icon_level.svg",
                                width: 24,
                              ),
                              Text(
                                "쉬움",
                                style: TextStyle(
                                    color: Color(0xff9e9e9e),
                                    fontFamily: 'Noto_Serif_KR',
                                    fontSize: 14,
                                    height: 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SvgPicture.asset("assets/images/icon_light.svg",
                                  width: 24),
                              Text(
                                "중",
                                style: TextStyle(
                                    color: Color(0xff9e9e9e),
                                    fontFamily: 'Noto_Serif_KR',
                                    fontSize: 14,
                                    height: 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SvgPicture.asset("assets/images/icon_water.svg",
                                  width: 24),
                              Text(
                                "중",
                                style: TextStyle(
                                    color: Color(0xff9e9e9e),
                                    fontFamily: 'Noto_Serif_KR',
                                    fontSize: 14,
                                    height: 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              SvgPicture.asset("assets/images/icon_temp.svg",
                                  width: 24),
                              Text(
                                "21~25도",
                                style: TextStyle(
                                    color: Color(0xff9e9e9e),
                                    fontFamily: 'Noto_Serif_KR',
                                    fontSize: 14,
                                    height: 1.4,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "화분추가",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          backgroundColor: primaryColor,
                          minimumSize: Size(280.0, 40.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
