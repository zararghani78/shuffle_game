
/*import 'dart:math';

import 'package:flutter/material.dart';



class LevelMenu extends StatelessWidget {
  final List<bool> completedLevels;

  LevelMenu({required this.completedLevels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level Menu'),
      ),
      body: ListView.builder(
        itemCount: completedLevels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Level ${index + 1}'),
            trailing: completedLevels[index] ? Icon(Icons.check_circle, color: Colors.green) : Icon(Icons.circle, color: Colors.grey),
          );
        },
      ),
    );
  }
}




class NameMatchingGame extends StatefulWidget {
  @override
  _NameMatchingGameState createState() => _NameMatchingGameState();
}

class _NameMatchingGameState extends State<NameMatchingGame> {
  List<String> names = [
    "PANADOL",
    "BRUFEN",
    "ATIVAN",
    "CNAPK",
    "COLOFAC",
    "DIGOXIN",
    "EBIXA",
    "EZIDAY",
    "INSULIN",
    "ZAFNOL"
  ];
  String originalName = "";
  String shuffledName = "";
  String userInput = "";
  int currentLevel = 1;
  int maxLevel = 10;

  @override
  void initState() {
    super.initState();
    startLevel();
  }

  void startLevel() {
    var rng = Random();
    originalName = names[rng.nextInt(names.length)];
    do {
      shuffledName = String.fromCharCodes(originalName.runes.toList()..shuffle(rng));
    } while (shuffledName == originalName);
    setState(() {
      userInput = "";
    });
  }

  void checkAnswer() {
    if (userInput.toUpperCase() == originalName.toUpperCase()) {
      if (currentLevel < maxLevel) {
        setState(() {
          currentLevel++;
        });
        startLevel();
      } 
     else
      
      {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("Congratulations"),
            content: Text("You have completed all levels!"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  restartGame();
                },
                child: Text("Restart"),
              ),
            ],
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Incorrect"),
          content: Text("Try again!"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void onAlphabetButtonPressed(String alphabet) {
    if (userInput.length < shuffledName.length) {
      setState(() {
        userInput += alphabet;
      });
    }
  }

  void restartGame() {
    setState(() {
      currentLevel = 1;
    });
    startLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name Matching Game - Level $currentLevel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Medican Name:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Text(
              shuffledName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Text(
              'Your try:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                shuffledName.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 50.0,
                    child: TextField(
                      readOnly: true,
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: userInput.length > index ? userInput[index] : ""),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 10.0,
              runSpacing: 10.0,
              children: List.generate(
                26,
                (index) => ElevatedButton(
                  onPressed: () {
                    onAlphabetButtonPressed(String.fromCharCode('A'.codeUnitAt(0) + index));
                  },
                  child: Text(String.fromCharCode('A'.codeUnitAt(0) + index)),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    checkAnswer();
                  },
                  child: Text('Check'),
                ),
                SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userInput = "";
                    });
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
*/
