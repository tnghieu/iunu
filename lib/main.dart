import 'package:flutter/material.dart';
import 'package:plant_color_matching/models/chosenPlantsModel.dart';
import 'package:plant_color_matching/screens/game.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ChosenPlantsModel(),
        child: const Game(),
      ),
    );
  }
}
