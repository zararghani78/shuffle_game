import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameController {
  List<String> names;
  int currentNameIndex = 0; // Track the index of the current name to display
  String originalName = "";
  String shuffledName = "";
  String userInput = "";
  int currentLevel = 1;
  int maxLevel = 10;

  List<double> levelAccuracies = List.filled(10, 0.0);

  List<bool> completedLevels = List.filled(10, false);
  bool textDisplayed = false;
  double accuracy = 0.0; // Variable to store the accuracy result

  GameController({required this.names});

  Future<void> saveGameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentLevel', currentLevel);
    await prefs.setStringList(
        'completedLevels', completedLevels.map((completed) => completed ? '1' : '0').toList());
  }

  Future<void> loadGameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLevel = prefs.getInt('currentLevel') ?? 1;
    if (currentLevel > maxLevel) {
      currentLevel = 1; // Reset to level 1 if currentLevel is greater than maxLevel
    }
    completedLevels = (prefs.getStringList('completedLevels') ?? List.filled(maxLevel, '0'))
        .map((status) => status == '1')
        .toList();
  }

  void startLevel() {
    if (!isAllLevelsCompleted()) {
      originalName = names[currentNameIndex];
      var rng = Random();
      do {
        shuffledName = String.fromCharCodes(originalName.runes.toList()..shuffle(rng));
      } while (shuffledName == originalName);
      userInput = "";
      textDisplayed = true;
      currentNameIndex = (currentNameIndex + 1) % names.length; // Move to the next name index
    }
  }


  int levenshteinDistance(String a, String b) {
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;

    List<int> previousRow = List<int>.generate(b.length + 1, (int index) => index);

    for (int i = 0; i < a.length; i++) {
      List<int> currentRow = List<int>.filled(b.length + 1, 0);
      currentRow[0] = i + 1;
      for (int j = 0; j < b.length; j++) {
        int cost = (a[i] == b[j]) ? 0 : 1;
        currentRow[j + 1] = [
          currentRow[j] + 1, // Insertion
          previousRow[j + 1] + 1, // Deletion
          previousRow[j] + cost // Substitution
        ].reduce((int min, int elem) => elem < min ? elem : min);
      }
      previousRow = currentRow;
    }

    return previousRow[b.length];
  }
  
  
  
   void checkAnswer(BuildContext context) {
    String normalizedUserInput = userInput.toUpperCase();
    String normalizedOriginalName = originalName.toUpperCase();

    int distance = levenshteinDistance(normalizedUserInput, normalizedOriginalName);
    if (normalizedOriginalName.isEmpty) {
      accuracy = 0.0;
    } else {
      accuracy = (1 - (distance / normalizedOriginalName.length)) * 100;
    }

    if (currentLevel <= maxLevel) {
      textDisplayed = false;
      completedLevels[currentLevel - 1] = true;
      levelAccuracies[currentLevel - 1] = accuracy; // Store accuracy for the current level
      currentLevel++;
      textDisplayed = false; // Reset textDisplayed flag
      saveGameState(); // Save game state after completing a level
    }

    int completedCount = completedLevels.where((completed) => completed).length;
    if (completedCount == maxLevel) {
      double totalAccuracy = levelAccuracies.reduce((value, element) => value + element);
      double averageAccuracy = totalAccuracy / maxLevel;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Congratulations"),
          content: Text(
            'Your overall accuracy rate is : ${averageAccuracy.toStringAsFixed(2)}%',
            style: const TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                restartGame();
              },
              child: const Text("Restart"),
            ),
            
          ],
        ),
      );
    } else {
      startLevel(); // Move to the next level
      
    }
  }

bool isAllLevelsCompleted() {
  return completedLevels.every((completed) => completed);
}

void showOverallAccuracy(BuildContext context) {
  // Calculate overall accuracy
  double overallAccuracy = calculateOverallAccuracy();
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Congratulations"),
      content: Text(
        'Your Overall Accuracy rate is : ${overallAccuracy.toStringAsFixed(2)}%',
        style: const TextStyle(fontSize: 20.0),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            restartGame();
          },
          child: const Text("Restart"),
        ),
      ],
    ),
  );
}

double calculateOverallAccuracy() {
  int totalLevels = completedLevels.length;
  int totalCompletedLevels = completedLevels.where((completed) => completed).length;
  int totalAccuracy = completedLevels
      .map((completed) => completed ? 100 : 0)
      .fold(0, (previousValue, element) => previousValue + element);
  return totalCompletedLevels > 0 ? totalAccuracy / totalCompletedLevels : 0.0;
}

  void onAlphabetButtonPressed(String alphabet) {
    if (userInput.length < shuffledName.length) {
      userInput += alphabet;
    }
  }

  void restartGame() {
    currentLevel = 1;
    completedLevels = List<bool>.filled(maxLevel, false);
    startLevel();
  }
}





















































/*

class GameController {
  List<String> names;
  String originalName = "";
  String shuffledName = "";
  String userInput = "";
  int currentLevel = 1;
  int maxLevel = 10;

  List<bool> completedLevels = List.filled(10, false);
  List<double> levelAccuracies = List.filled(10, 0.0);

  GameController({required this.names});

  Future<void> saveGameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentLevel', currentLevel);
    await prefs.setStringList(
      'completedLevels',
      completedLevels.map((completed) => completed ? '1' : '0').toList(),
    );
  }

  Future<void> loadGameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentLevel = prefs.getInt('currentLevel') ?? 1;
    if (currentLevel > maxLevel) {
      currentLevel = 1;
    }
    completedLevels = (prefs.getStringList('completedLevels') ?? List.filled(maxLevel, '0'))
        .map((status) => status == '1')
        .toList();
  }

  void startLevel() {
    var rng = Random();
    originalName = names[rng.nextInt(names.length)];
    do {
      shuffledName = String.fromCharCodes(originalName.runes.toList()..shuffle(rng));
    } while (shuffledName == originalName);
    userInput = "";
    textDisplayed = true;
  }

  int levenshteinDistance(String a, String b) {
    if (a.isEmpty) return b.length;
    if (b.isEmpty) return a.length;

    List<int> previousRow = List<int>.generate(b.length + 1, (int index) => index);

    for (int i = 0; i < a.length; i++) {
      List<int> currentRow = List<int>.filled(b.length + 1, 0);
      currentRow[0] = i + 1;
      for (int j = 0; j < b.length; j++) {
        int cost = (a[i] == b[j]) ? 0 : 1;
        currentRow[j + 1] = [
          currentRow[j] + 1, // Insertion
          previousRow[j + 1] + 1, // Deletion
          previousRow[j] + cost // Substitution
        ].reduce((int min, int elem) => elem < min ? elem : min);
      }
      previousRow = currentRow;
    }

    return previousRow[b.length];
  }

  void checkAnswer(BuildContext context) {
    String normalizedUserInput = userInput.toUpperCase();
    String normalizedOriginalName = originalName.toUpperCase();

    int distance = levenshteinDistance(normalizedUserInput, normalizedOriginalName);
    double accuracy = 0.0;
    if (normalizedOriginalName.length > 0) {
      accuracy = (1 - (distance / normalizedOriginalName.length)) * 100;
    }

    if (normalizedUserInput == normalizedOriginalName) {
      if (currentLevel <= maxLevel) {
        completedLevels[currentLevel - 1] = true;
        levelAccuracies[currentLevel - 1] = accuracy;
        currentLevel++;
        textDisplayed = false;
        saveGameState();
      }
    }

    int completedCount = completedLevels.where((completed) => completed).length;
    if (completedCount == maxLevel) {
      double totalAccuracy = levelAccuracies.reduce((value, element) => value + element);
      double averageAccuracy = totalAccuracy / maxLevel;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Congratulations"),
          content: Text(
            'You completed all levels! Your overall accuracy rate is : ${averageAccuracy.toStringAsFixed(2)}%',
            style: const TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                restartGame();
              },
              child: const Text("Restart"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessionSelect(),
                  ),
                );
              },
              child: const Text("Play Next Level"),
            ),
          ],
        ),
      );
    } else {
      startLevel();
    }
  }

  void onAlphabetButtonPressed(String alphabet) {
    if (userInput.length < shuffledName.length) {
      userInput += alphabet;
    }
  }

  void restartGame() {
    currentLevel = 1;
    completedLevels = List<bool>.filled(maxLevel, false);
    startLevel();
  }
}




*/