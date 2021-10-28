import 'package:get/get.dart';
import 'package:ifplant_app/app/data/model/home/plant_model.dart';

class HomeController extends GetxController {
  final RxList<Plant> _selectedPlants = <Plant>[].obs;

  List<Plant> get selectedPlants => _selectedPlants;

  addPlant(Plant selectPlant, {int? index = 0}) {
    if (index != null) {
      _selectedPlants.insert(index, selectPlant);
    } else {
      _selectedPlants.add(selectPlant);
    }
  }
}
