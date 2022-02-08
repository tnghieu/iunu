import 'package:flutter/material.dart';

class ChosenPlantsModel extends ChangeNotifier {
  List<String> chosenPlants = [];
  int colorIndex = 0;

  void addPlant({required String plant}) {
    if (!chosenPlants.contains(plant)) {
      chosenPlants.add(plant);
    }
    notifyListeners();
  }
}
