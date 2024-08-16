

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home/home_page.dart';

class RouteGenerator{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    print("========RouteGenerator==========");
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/second':
        print("========second=========");
        return MaterialPageRoute(builder: (_) => SecondPage(settings.arguments as String));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}