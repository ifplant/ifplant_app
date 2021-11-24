import 'package:flutter/material.dart';
import 'package:ifplant_app/app/controller/controllers.dart'
    show HomeController;
import 'package:ifplant_app/app/route/app_pages.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:ifplant_app/app/ui/android/home/components.dart' show PlantItem;
import 'package:get/get.dart';

class SelectedPlantList extends StatefulWidget {
  const SelectedPlantList({Key? key}) : super(key: key);

  @override
  State<SelectedPlantList> createState() => _SelectedPlantListState();
}

class _SelectedPlantListState extends State<SelectedPlantList> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return RawScrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        thickness: 10.0,
        thumbColor: primaryColor,
        radius: const Radius.circular(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            margin: const EdgeInsets.only(bottom: 15),
            height: 120,
            child: Row(
              children: <Widget>[
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // onReorder: (oldIndex, newIndex) {
                  //   if (oldIndex < newIndex) {
                  //     newIndex--;
                  //   }
                  //   final item = homeController.selectedPlants.removeAt(oldIndex);
                  //   homeController.addPlant(item, index: newIndex);
                  // },
                  itemBuilder: (ctx, index) {
                    return PlantItem(
                      index: index,
                      key: Key('$index'),
                    );
                  },
                  itemCount: homeController.selectedPlants.length,
                ),
                homeController.selectedPlants.length < 10
                    ? Container(
                        margin: const EdgeInsets.only(left: 10),
                        height: 46,
                        width: 46,
                        child: InkWell(
                          child: const CircleAvatar(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            backgroundColor: primaryColor,
                          ),
                          onTap: () {
                            Get.toNamed(Routes.PLANTLIST);
                          },
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
