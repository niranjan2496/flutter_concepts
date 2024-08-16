
import 'dart:async';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/home/home_bloc.dart';
import 'package:practice/home/home_event.dart';
import 'package:practice/home/home_state.dart';


class HomePage extends StatefulWidget {


  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 1;
  Future<String> newIsolate(dynamic st) async{
    print("child===isolate======${Isolate.current.runtimeType}");
    setState(() {
      ++counter;
    });
    return "child isolate result";
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1),newIsolate);
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc,HomeState>(
      bloc: context.read<HomeBloc>(),
      buildWhen:(previous,current){
        print("=======$previous==========$current");
        return false;
      },
      listenWhen: (previous,current){
        print("=======$previous==========$current");
        return true;
      },
      builder: (context,state){
        print("=builder======$context==========$state");

        return  Scaffold(
          appBar:  AppBar(
            title: Text("Home Page"),
          ),
          body: Center(
            child: ElevatedButton(
              child: Text("click $counter"),
              onPressed: () async{
                // context.read<HomeBloc>().add(HomeScreenRefreshEvent());
                // Navigator.of(context).pushNamed("/second",arguments: "data from first page");
                try {
                  print("child===isolate======${Isolate.current.runtimeType}");
                  var r = await Isolate.spawn(newIsolate,'hh');
                  print("=============result======$r");

                }catch(e) {
                  print("==${e.toString()}");
                }
              },
            ),
          ),
        );
      },
      listener: (context,state){
        Navigator.of(context).pushNamed("/second",arguments: "data from first page");
      },

    );
  }
}



class SecondPage extends StatelessWidget {
   SecondPage(this.data,{super.key});
  String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: Text(data),
    );
  }
}




class SimpleBlockObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    print("=====method===========onChange");
    super.onChange(bloc, change);
  }
  @override
  void onEvent(Bloc bloc, Object? event) {
    print("=====method===========onEvent");
    super.onEvent(bloc, event);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print("=====method===========onTransition");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print("=====method===========onError");
  }
}