import 'package:flutter/material.dart';
import 'package:plant_color_matching/constants.dart';
import 'package:plant_color_matching/models/chosenPlantsModel.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    final List<String> colorList = plantColorMap.keys.toList();
    final List<String> plantList = plantEmojis;

    List<Text> displayChosenPlants(
        {required ChosenPlantsModel chosenPlantsModel}) {
      List<Text> chosenPlantsWidget = [];

      for (String plantEmoji in chosenPlantsModel.chosenPlants) {
        chosenPlantsWidget.add(
          Text(plantEmoji),
        );
      }

      return chosenPlantsWidget;
    }

    return Consumer<ChosenPlantsModel>(
      builder: (context, chosenPlantsModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Pick all Plants that are ... '),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              colorList[chosenPlantsModel.colorIndex],
              style: const TextStyle(fontSize: 48),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: plantList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              itemBuilder: (BuildContext context, int index) {
                return TextButton(
                  child: Text(
                    plantList[index],
                    style: const TextStyle(fontSize: 36),
                  ),
                  onPressed: () {
                    chosenPlantsModel.addPlant(plant: plantList[index]);
                  },
                );
              },
            ),
            Expanded(
              child: Wrap(
                children:
                    displayChosenPlants(chosenPlantsModel: chosenPlantsModel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
