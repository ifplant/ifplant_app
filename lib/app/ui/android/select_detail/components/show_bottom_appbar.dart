import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:ifplant_app/app/ui/android/select_detail/components/build_bottom_sheet.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:intl/intl.dart';

class ShowBottomAppBar extends StatelessWidget {
  final Plant plant;
  const ShowBottomAppBar({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _show = false;

    return Container(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        child: BottomAppBar(
            elevation: 10.0,
            child: Container(
              height: 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icon/arrow_less.svg',
                        width: 24,
                        height: 24,
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          barrierColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45),
                            ),
                          ),
                          context: context,
                          builder: (context) => _show
                              ? Text('데이터가 존재하지 않습니다.')
                              : BuildBottomSheet(plant: plant),
                        ).then((value) => Get.back());
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  plant.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    plant.kind,
                                    style: const TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              NumberFormat('###,###,###,###원')
                                  .format(int.parse(plant.price))
                                  .replaceAll(' ', ''),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          plant.engName,
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
