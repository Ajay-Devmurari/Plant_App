import 'package:flutter/cupertino.dart';

import '../model/plant_model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Plant> _favPlantList = [];

  List<Plant> get favPlant => _favPlantList;

  void favItem(Plant plant) {
    if (_favPlantList.contains(plant)) {
      _favPlantList.remove(plant);
      plant.isFavorite = false;
    } else {
      _favPlantList.add(plant);
      plant.isFavorite = true;
    }
    notifyListeners();
  }
}
