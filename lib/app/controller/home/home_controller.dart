import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final RxList<Plant> _selectedPlants = <Plant>[].obs;
  final RxList<Plant> _dragedPlants = <Plant>[].obs;
  final Rx<File> _selectedImage = File("").obs;
  final RxBool _isSelectBackground = false.obs;
  final RxBool _isDeleteButtonClick = false.obs;
  late ImagePicker _picker;

  @override
  void onInit() {
    super.onInit();
    _picker = ImagePicker();
  }

  List<Plant> get selectedPlants => _selectedPlants;
  List<Plant> get dragedPlants => _dragedPlants;
  File get selectedImage => _selectedImage.value;
  bool get isSelectBackground => _isSelectBackground.value;
  bool get isDeleteButtonClick => _isDeleteButtonClick.value;

  addPlant(Plant selectPlant, {int? index = 0}) {
    if (index != null) {
      _selectedPlants.insert(index, selectPlant);
    } else {
      _selectedPlants.add(selectPlant);
    }
  }

  removePlant(int index) {
    _selectedPlants.removeAt(index);
    update();
  }

  removeDragedItem(int index) {
    _dragedPlants.removeAt(index);
    update();
  }

  toggleDragedItem(int itemId) {
    final findItem =
        _selectedPlants.firstWhere((element) => element.id == itemId);
    findItem.isDraged = true;
    _dragedPlants.add(findItem);

    update();
  }

  deleteDragedItem(int itemId) {
    _selectedPlants.removeWhere((element) => element.id == itemId);
    _dragedPlants.removeWhere((element) => element.id == itemId);
    update();
  }

  toggleDeleteButtonSelect() {
    _isDeleteButtonClick.value = true;
    update();
  }

  toggleBackgroundSelect(Plant plant) {
    unToggleBackgroundSelect();
    final index = _dragedPlants.indexWhere((element) => element == plant);
    _dragedPlants[index].isClicked = !_dragedPlants[index].isClicked;
    update();
  }

  unToggleBackgroundSelect() {
    for (var element in _dragedPlants) {
      element.isClicked = false;
    }
    _isDeleteButtonClick.value = false;
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
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
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
