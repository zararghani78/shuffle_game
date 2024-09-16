import 'package:flutter/material.dart';
import 'package:shuffle_game/Levels/medican_level/leveleight.dart';
import 'package:shuffle_game/Levels/medican_level/levelfive.dart';
import 'package:shuffle_game/Levels/medican_level/levelfour.dart';
import 'package:shuffle_game/Levels/medican_level/levelnine.dart';
//import 'package:shuffle_game/Screens/selectmession.dart';

import 'package:shuffle_game/Levels/medican_level/levelone.dart';
import 'package:shuffle_game/Levels/medican_level/levelseven.dart';
import 'package:shuffle_game/Levels/medican_level/levelsix.dart';
import 'package:shuffle_game/Levels/medican_level/levelten.dart';
import 'package:shuffle_game/Levels/medican_level/levelthree.dart';
import 'package:shuffle_game/Levels/medican_level/leveltwo.dart';
import 'package:shuffle_game/Routes/route.dart';
//import 'package:shuffle_game/Screens/checklevel.dart';
//import 'package:shuffle_game/Screens/level.dart';
import 'package:shuffle_game/Screens/mainmenu_screen.dart';
import 'package:shuffle_game/Screens/selectmession.dart';


class RoutesLink {

  

 
static Route<dynamic> generateroutes(RouteSettings settings){

  switch(settings.name){

    case RouteName.mainmenu:
    return MaterialPageRoute(builder:(BuildContext context) => MainMenuScreen());
      
 case RouteName.messionselect:
    return MaterialPageRoute(builder:(BuildContext context) => const MessionSelect());
      case RouteName.level:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelone());
      case RouteName.leveltwo:
    return MaterialPageRoute(builder:(BuildContext context) => const Leveltwo());
       case RouteName.levelthree:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelthree());
      case RouteName.levelfour:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelfour());
       case RouteName.levelfive:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelfive());
      case RouteName.levelsix:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelsix());
       case RouteName.levelseven:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelseven());
      case RouteName.leveleight:
    return MaterialPageRoute(builder:(BuildContext context) => const Leveleight());
     case RouteName.levelnine:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelnine());
     case RouteName.levelten:
    return MaterialPageRoute(builder:(BuildContext context) => const Levelten());

    
  default:
    return MaterialPageRoute(builder:(_){

      return Scaffold(
        body: Column(
          children: [
            Center(
              child:Text("No route define for ${settings.name}")
            )
          ],
        ),
      );
    

}
    );
  }
}

 
}