
import 'package:flutter/material.dart';
import 'package:shuffle_game/Routes/route.dart';


class LevelMenu extends StatelessWidget {
  final List<bool> completedLevels;

  const LevelMenu({super.key, required this.completedLevels});



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Level Menu'),
      ),
      backgroundColor: Colors.blue,
      body: Column(
      //  crossAxisAlignment: CrossAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Expanded(
              
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 7.0,
                  crossAxisSpacing: 6.0,
                ),
                itemCount: completedLevels.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (completedLevels[index]) {
                        Navigator.pushNamed(context, RouteName.level);
                        // Navigate to the level
                       // print('Navigating to Level ${index + 1}');
                      } else {
                        // Level locked, show a message or do nothing
                        print('Level ${index + 1} is locked');
                      }
                    },
                    child: Container(
                      color: completedLevels[index] ? Colors.white : Colors.grey[300],
                      child: Center(
                        child: Icon(
                          completedLevels[index] ? Icons.lock_open  : Icons.lock,
                          size: 20.0,
                          color: completedLevels[index] ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          
        ],
      ),
    );
  }
}



/*



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

*/