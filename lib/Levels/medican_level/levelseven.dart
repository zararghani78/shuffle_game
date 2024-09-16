













import 'package:flutter/material.dart';
import 'package:shuffle_game/Screens/checklevel.dart';
import 'package:shuffle_game/model/gamecontroller.dart';

class Levelseven extends StatefulWidget {
  const Levelseven({super.key});

  @override
  _LevelsevenState createState() => _LevelsevenState();
}

class _LevelsevenState extends State<Levelseven> {
  late GameController gameController;



  

  @override
  void initState() {
    super.initState();
    gameController = GameController(names: [
      "X-ray",
"CT Scan",
"MRI",
"Ultrasound",
"PET Scan",
"Mammography",
"Fluoroscopy",
"Nuclear Medicine",
"Angiography",
"Bone Densitometry",
    ],
  );
    gameController.loadGameState();
    gameController.startLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Level ${gameController.currentLevel}'),
      ),
      body: ListView(
        children: [Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 15,),
              const Text(
                'Medical Imaging',
                style: TextStyle(fontSize: 20.0,color: Colors.white),
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 5),
                child: Text(
                  gameController.shuffledName,
                  style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold ,color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
             /* const SizedBox(height: 15.0),
              const Text(
                'Your try:',
                style: TextStyle(fontSize: 20.0),
              ),*/
              const SizedBox(height: 8.0),
             
              Wrap(
                alignment: WrapAlignment.center,
                children: 
                     List.generate(
                      
              gameController.shuffledName.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 50.0,
                height: 50,
                
                  child: TextField(
                  //  style: TextStyle(color: Colors.white),
                    readOnly: true,
                    textAlign: TextAlign.center,
                    controller: TextEditingController(
                        text: gameController.userInput.length > index
                            ? gameController.userInput[index]
                            : ""),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
            
 filled: true, // Set filled to true
            fillColor: Colors.white, // Set fillColor to white
                    ),
                  ),
                ),
              ),
                            ),
                
              ),
             
              const SizedBox(height: 15.0),
             
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 3.0,
                children: List.generate(
                  26,
                  (index) => ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gameController.onAlphabetButtonPressed(
                            String.fromCharCode('A'.codeUnitAt(0) + index));
                      });
                    },
                    child: Text(String.fromCharCode('A'.codeUnitAt(0) + index)),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 ElevatedButton(
  onPressed: gameController.userInput.length == gameController.shuffledName.length
      ? () {
          setState(() {
            gameController.checkAnswer(context);
          });
        }
      : null, // Disable the button if the input is incomplete
  child: const Text('Submit'),
),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gameController.userInput = "";
                      });
                    },
                    child: const Text('Clear'),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          LevelMenu(completedLevels: gameController.completedLevels),
                    ),
                  );
                },
                child: const Text('Level Menu'),
              ),
            ],
          ),
        ),
        ]
      ),
   
    );
  }
}





































