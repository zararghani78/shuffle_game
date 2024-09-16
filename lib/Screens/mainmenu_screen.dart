

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shuffle_game/Routes/route.dart';
import 'package:shuffle_game/resourse/button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Play Game'),
        
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           Buttons(
            title: 'Play', 
             height: 40,
            width: 100,
            onPressed: (){
              Navigator.pushNamed(context,RouteName.messionselect);
            },
            ),
             Buttons(
            title: 'Setting', 
            height: 40,
            width: 100,
            onPressed: (){},
            ),
            Buttons(
  height: 40,
  width: 100,
  title: 'Exit', 
  onPressed: (){
    SystemNavigator.pop();
  },
)

          ],
        ),
      ),
    );
  }
}





