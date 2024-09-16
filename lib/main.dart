import 'package:flutter/material.dart';
import 'package:shuffle_game/Routes/route.dart';
import 'package:shuffle_game/Routes/routes_link.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shuffle game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: RouteName.mainmenu,
        onGenerateRoute:RoutesLink.generateroutes,
    );
  }
}