import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/selected_plant_model.dart';
import 'package:ifplant_app/app/ui/theme/app_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final RxList<SelectedPlant> _selectedPlants = <SelectedPlant>[].obs;
  final RxList<SelectedPlant> _dragedPlants = <SelectedPlant>[].obs;
  final Rx<File> _selectedImage = File("").obs;
  final RxBool _isSelectBackground = false.obs;
  final RxBool _isDeleteButtonClick = false.obs;
  final RxInt _selectedIdCount = 0.obs;
  late ImagePicker _picker;

  @override
  void onInit() {
    super.onInit();
    _picker = ImagePicker();
  }

  List<SelectedPlant> get selectedPlants => _selectedPlants;
  List<SelectedPlant> get dragedPlants => _dragedPlants;
  File get selectedImage => _selectedImage.value;
  bool get isSelectBackground => _isSelectBackground.value;
  bool get isDeleteButtonClick => _isDeleteButtonClick.value;
  int get selectedIdCount => _selectedIdCount.value;

  addPlant(SelectedPlant selectPlant, {int? index}) {
    if (index != null) {
      _selectedPlants.insert(index, selectPlant);
    } else {
      _selectedPlants.add(selectPlant);
      _selectedIdCount.value = _selectedIdCount.value + 1;
    }
    update();
  }

  removeSeletedItem(SelectedPlant plant) {
    _selectedPlants.removeWhere((element) => element.id == plant.id);
    update();
  }

  removeDragedItem(SelectedPlant plant) {
    _dragedPlants.removeWhere((element) => element.id == plant.id);
    update();
  }

  toggleDragedItem(int itemId) {
    final findItem =
        _selectedPlants.firstWhere((element) => element.id == itemId);
    findItem.isDraged = true;
    _dragedPlants.add(findItem);
    update();
  }

  toggleDeleteButtonSelect(SelectedPlant plant) {
    unToggleBackgroundSelect();
    final index = _dragedPlants.indexWhere((element) => element == plant);
    _dragedPlants[index].isDeleteButtonClick = true;
    update();
  }

  toggleBackgroundSelect(SelectedPlant plant) {
    unToggleBackgroundSelect();
    final index = _dragedPlants.indexWhere((element) => element == plant);
    _dragedPlants[index].isClicked = !_dragedPlants[index].isClicked;
    update();
  }

  unToggleBackgroundSelect() {
    for (var element in _dragedPlants) {
      element.isClicked = false;
      element.isDeleteButtonClick = false;
    }
    update();
  }

  Future pickSingleImage() async {
    await _picker.pickImage(source: ImageSource.gallery).then((value) async {
      if (value != null) {
        File? croppedFile = await ImageCropper.cropImage(
          sourcePath: value.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: const AndroidUiSettings(
              toolbarTitle: '이미지 편집',
              toolbarColor: primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
        );
        _selectedImage(croppedFile);
        update();
      }
    });
  }
}
