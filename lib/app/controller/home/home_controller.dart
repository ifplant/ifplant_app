import 'dart:io';

import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final RxList<Plant> _selectedPlants = <Plant>[].obs;
  final RxList<Plant> _dragedPlants = <Plant>[].obs;
  final Rx<File> _selectedImage = File("").obs;
  final RxBool _isSelectBackground = false.obs;
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
    update();
  }

  Future pickSingleImage() async {
    await _picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        _selectedImage(File(value.path));
      }
    });
  }
}
