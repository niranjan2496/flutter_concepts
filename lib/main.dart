
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/home/home_bloc.dart';
import 'package:practice/home/home_page.dart';
import 'package:practice/route_generator.dart';




//multiBloc provider implementation
// void main() {
//   Bloc.observer = SimpleBlockObserver();
//   runApp(MultiBlocProvider(
//     providers: [
//       BlocProvider<HomeBloc>(create:(context)=>HomeBloc())
//     ],
//       child: MaterialApp(
//         initialRoute: '/',
//         onGenerateRoute: RouteGenerator.generateRoutes,
//       ),
//   ),
//   );
// }


// provider implementation
void main() {
  Bloc.observer = SimpleBlockObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(create:(context)=>HomeBloc())
    ],
      child: const MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoutes,
      ),
  ),
  );
}



