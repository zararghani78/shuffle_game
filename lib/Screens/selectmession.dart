
import 'package:flutter/material.dart';
import 'package:shuffle_game/Routes/route.dart';
//import 'package:shuffle_game/Routes/routes_link.dart';
import 'package:shuffle_game/resourse/button.dart';



class MessionSelect extends StatefulWidget {
  const MessionSelect({super.key});

  @override
  _MessionSelectState createState() => _MessionSelectState();
}

class _MessionSelectState extends State<MessionSelect> {
  List<bool> levelCompletionStatus = List.generate(10, (index) => false);
  List<String> levelTitles = [
    'Medicine',
    'Surgery Tools',
    'Monitoring Devices',
    'Diagnostic Equipment',
    'Medical Supplies',
    'Treatment Equipment',
    'Medical Imaging',
    'Laboratory Equipment',
    'Emergency Response Equipment',
    'Rehabilitation Equipment',
  ];
  List<String> routeLinks = [
    RouteName.level,
    RouteName.leveltwo,
    RouteName.levelthree,
    RouteName.levelfour,
    RouteName.levelfive,
    RouteName.levelsix,
    RouteName.levelseven,
    RouteName.leveleight,
    RouteName.levelnine,
    RouteName.levelten,
  ];
  int currentLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Choose Mession'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Wrap(
                children: List.generate(10, (index) {
                  return Buttons(
                    height: 60,
                    width: 110,
                    title: levelTitles[index], // Use the title from the list
                    onPressed: () {
                      if (index == 0 || levelCompletionStatus[index - 1]) {
                        Navigator.pushNamed(context, routeLinks[index]);
                        if (!levelCompletionStatus[index]) {
                          setState(() {
                            levelCompletionStatus[index] = true;
                          });
                        }
                      }
                    },
                    shadowColor: levelCompletionStatus[index]
                        ? (currentLevel == index + 1 ? Colors.transparent : Colors.grey)
                        : Colors.grey,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
