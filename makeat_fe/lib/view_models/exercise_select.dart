import 'package:flutter/material.dart';

class ExerciseSelectProvider extends ChangeNotifier {

  List<List<String>> _selectedExercise = [];
  List<List<String>> get selectedExercise => _selectedExercise;

  void updateSelectedExercise(List<List<String>> exercise) {
    _selectedExercise = exercise;
    notifyListeners();
    print(_selectedExercise);
  }
}