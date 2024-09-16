import 'dart:math';

import 'package:flutter/material.dart';

class PageFunction {
  List<String> names = [
    "JOHN",
    "JANE",
    "ALICE",
    "BOB",
    "CHARLIE",
    "DAVID",
    "EMMA",
    "OLIVIA",
    "LIAM",
    "NOAH"
  ];

  late String originalName;
  late String shuffledName;
  late String userInput;
  late int currentLevel;
  late int remainingTries;
  late BuildContext context;

  PageFunction({
    required this.originalName,
    required this.currentLevel,
    required this.remainingTries,
    required this.shuffledName,
    required this.userInput,
    required this.context,
  });

  void setState(VoidCallback fn) {
    fn();
  }

  void startLevel() {
    var rng = Random();
    originalName = names[rng.nextInt(names.length)];
    shuffledName = String.fromCharCodes(originalName.runes.toList()..shuffle(rng));
    userInput = "";
    remainingTries = 3;
  }

  void onAlphabetButtonPressed(String alphabet) {
    if (userInput.length < shuffledName.length) {
      userInput += alphabet;
    }
  }

  void checkAnswer() {
    if (userInput.toUpperCase() == originalName.toUpperCase()) {
      currentLevel++;
      startLevel();
    } else {
      if (remainingTries > 1) {
        remainingTries--;
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Incorrect"),
            content: Text("You have $remainingTries ${remainingTries > 1 ? 'tries' : 'try'} left."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Failed"),
            content: const Text("You failed!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  startLevel();
                },
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    }
  }
}
